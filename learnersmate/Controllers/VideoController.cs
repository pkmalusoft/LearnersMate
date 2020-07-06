using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using learnersmate.Models;
using SelectPdf;
using Microsoft.Owin.Security;
using learnersmate.Context;
using learnersmate.Filters;
using Google.GData.Extensions;
using Google.GData.YouTube;
using Google.GData.Extensions.MediaRss;
using Google.YouTube;
using Google.GData.Client;
using System.IO;
using System.Configuration;

namespace learnersmate.Controllers
{
    [SessionCheck]
    public class VideoController : Controller
    {
        private DatabaseContext db = new DatabaseContext();

        // GET: Videos
        public ActionResult Index()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            int companyacademicyearid = Convert.ToInt16(Session["CompanyAcademicYearID"].ToString());
            int roleid = Convert.ToInt16(Session["RoleID"].ToString());
            int userid = Convert.ToInt16(Session["UserID"].ToString());
            int schoolid = Convert.ToInt16(Session["SchoolID"].ToString());
            var videos = db.Videos.Include(v => v.CurrentUser).OrderByDescending(t => t.Dou).ToList();
            return View(videos);
        }

        // GET: Videos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            learnersmate.Models.Video video = db.Videos.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            return View(video);
        }

        // GET: Videos/Create
        [SessionCreate]
        public ActionResult Create()
        {
            ViewBag.Message = Session["msg"];
            ViewBag.Error = Session["err"];
            Session["err"] = "";
            Session["msg"] = "";
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Email");
            learnersmate.Models.Video video = new learnersmate.Models.Video();
            video.UserID = Convert.ToInt16(Session["UserID"].ToString());
            video.VideoPath = "/";
            video.Dou = DateTime.Now;
            return View(video);
        }

        // POST: Videos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "VideoID,Name,Description,VideoPath,FileExt,UserID,Dou")] learnersmate.Models.Video video, HttpPostedFileBase uploadvideo, string newlogo, bool IsYoutube)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (newlogo == "")
            {
                Session["err"] = "Video required";
                data.message = Session["err"].ToString();
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            else {
                if (newlogo != "")
                {
                    video.VideoPath = newlogo;
                    var extention = Path.GetExtension(newlogo);
                    video.FileExt= extention;
                }
                db.Videos.Add(video);
                db.SaveChanges();

                if (IsYoutube)
                {
                    try
                    {
                        //////ref https://console.developers.google.com/apis/api/youtube.googleapis.com/overview?project=webbased-document-management
                        ///https://console.developers.google.com/apis/credentials?project=webbased-document-management
                        ///https://www.slickremix.com/docs/get-api-key-for-youtube/
                        YouTubeRequestSettings settings;
                        YouTubeRequest request;
                        string devkey = ConfigurationManager.AppSettings.Get("youtubedevkey");
                        string username = ConfigurationManager.AppSettings.Get("youtubeusername");
                        string password = ConfigurationManager.AppSettings.Get("youtubepassword");

                        string filepath = Server.MapPath("/" + newlogo.PadLeft(1).Replace("/", "\\"));
                        settings = new YouTubeRequestSettings("education", devkey, username, password) { Timeout = 999999999 };
                        request = new YouTubeRequest(settings);
                        Google.YouTube.Video videoyoutube = new Google.YouTube.Video();
                        videoyoutube.Title = video.Name;
                        videoyoutube.Description = video.Description;
                        videoyoutube.Tags.Add(new MediaCategory("Education", YouTubeNameTable.CategorySchema));
                        videoyoutube.Keywords = "Education";
                        videoyoutube.Private = false;
                        videoyoutube.MediaSource = new MediaFileSource(filepath, "video/flv");
                        Google.YouTube.Video createdVideo = request.Upload(videoyoutube); //In that createdVideo you will get uploaded video ID.

                        video.YoutubePath = createdVideo.VideoId;
                        db.Entry(video).State = EntityState.Modified;
                        db.SaveChanges();


                    }
                    catch (Exception exception)

                    {
                        Session["msg"] = "Cant upload youtube, Please check youtube api settings" + exception.Message;
                    }

                }

                Session["err"] = "";
                Session["msg"] += "Created Successfully";
            }
                   
                    

            data.message = "/Video/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        //public static Google.GData.YouTube.YouTubeService AuthenticateOaut(string clientId, string clientSecret, string userName)
        //{

        //    string[] scopes = new string[] { Google.GData.YouTube.YouTubeService.Scope.Youtube,  // view and manage your YouTube account
        //                                     Google.GData.YouTube.YouTubeService.Scope.YoutubeForceSsl,
        //                                     Google.Apis.YouTube.v3.YouTubeService.Scope.Youtubepartner,
        //                                     Google.Apis.YouTube.v3.YouTubeService.Scope.YoutubepartnerChannelAudit,
        //                                     Google.Apis.YouTube.v3.YouTubeService.Scope.YoutubeReadonly,
        //                                     Google.Apis.YouTube.v3.YouTubeService.Scope.YoutubeUpload};

        //    try
        //    {
        //        // here is where we Request the user to give us access, or use the Refresh Token that was previously stored in %AppData%
        //        UserCredential credential = GoogleWebAuthorizationBroker.AuthorizeAsync(new ClientSecrets { ClientId = clientId, ClientSecret = clientSecret }
        //                                                                                     , scopes
        //                                                                                     , userName
        //                                                                                     , CancellationToken.None
        //                                                                                     , new FileDataStore("Daimto.YouTube.Auth.Store")).Result;

        //        Google.Apis.YouTube.v3.YouTubeService service = new Google.Apis.YouTube.v3.YouTubeService(new Google.Apis.YouTube.v3.YouTubeService.Initializer()
        //        {
        //            HttpClientInitializer = credential,
        //            ApplicationName = "Web client 1",

        //        });
        //        return service;
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.InnerException);
        //        return null;

        //    }

        //}
        // GET: Videos/Edit/5
        [SessionEdit]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            learnersmate.Models.Video video = db.Videos.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Email", video.UserID);
            return View(video);
        }

        // POST: Videos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "VideoID,Name,Description,VideoPath,FileExt,UserID,Dou")] learnersmate.Models.Video video, HttpPostedFileBase uploadvideo, string newlogo, bool IsYoutube)
        {
            errordata data = new errordata();
            data.type = "error";
            Session["err"] = "Error, Please Check Input Fields";
            Session["msg"] = "";
            if (video.Name != "")
            {
                if (newlogo != "")
                {
                    video.VideoPath = newlogo;
                    var extention = Path.GetExtension(newlogo);
                    video.FileExt = extention;
                }
                db.Entry(video).State = EntityState.Modified;
                db.SaveChanges();

                if (IsYoutube)
                {
                    try
                    {
                        //////ref https://console.developers.google.com/apis/api/youtube.googleapis.com/overview?project=webbased-document-management
                        ///https://console.developers.google.com/apis/credentials?project=webbased-document-management
                        ///https://www.slickremix.com/docs/get-api-key-for-youtube/
                        YouTubeRequestSettings settings;
                        YouTubeRequest request;
                        string devkey = ConfigurationManager.AppSettings.Get("youtubedevkey");
                        string username = ConfigurationManager.AppSettings.Get("youtubeusername");
                        string password = ConfigurationManager.AppSettings.Get("youtubepassword");

                        string filepath = Server.MapPath("/" + newlogo.PadLeft(1).Replace("/", "\\"));
                        settings = new YouTubeRequestSettings("education", devkey, username, password) { Timeout = 999999999 };
                        request = new YouTubeRequest(settings);
                        Google.YouTube.Video videoyoutube = new Google.YouTube.Video();
                        videoyoutube.Title = video.Name;
                        videoyoutube.Description = video.Description;
                        videoyoutube.Tags.Add(new MediaCategory("Education", YouTubeNameTable.CategorySchema));
                        videoyoutube.Keywords = "Education";
                        videoyoutube.Private = false;
                        videoyoutube.MediaSource = new MediaFileSource(filepath, "video/");
                        Google.YouTube.Video createdVideo = request.Upload(videoyoutube); //In that createdVideo you will get uploaded video ID.

                        video.YoutubePath = createdVideo.VideoId;
                        db.Entry(video).State = EntityState.Modified;
                        db.SaveChanges();

                    }
                    catch
                    {
                        Session["msg"] = "Cant upload youtube, Please check youtube api settings";
                    }

                }

                Session["err"] = "";
                Session["msg"] += "Modified Successfully";
            }
            data.message = "/Video/Index";
            data.type = "success";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [SessionDelete]
        public ActionResult DeleteConfirm(int id)
        {
            Session["err"] = "Error, Can't Delete, Please check Dependency Data";
            Session["msg"] = "";
            try
            {
                learnersmate.Models.Video video = db.Videos.Find(id);
                db.Videos.Remove(video);
                db.SaveChanges();

                Session["err"] = "";
                Session["msg"] = "Deleted Successfully";

            }
            catch { }
            return RedirectToAction("Index");
        }
        
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
