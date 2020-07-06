﻿using learnersmate.Filters;
using learnersmate.Models;
using learnersmate.Repository;
using System;
using System.Web.Mvc;

namespace learnersmate.Controllers
{
    [ValidateSessionAttribute]
    public class ApplicationKeysController : Controller
    {
        IClientKeys _IClientKeys;
        //IRegisterCompany _IRegisterCompany;
        public ApplicationKeysController()
        {
            _IClientKeys = new ClientKeysConcrete();
           // _IRegisterCompany = new RegisterCompanyConcrete();
        }

        // GET: ApplicationKeys/GenerateKeys
        [HttpGet]
        public ActionResult GenerateKeys()
        {
            try
            {
                ClientKey clientkeys = new ClientKey();

                // Validating ClientID and ClientSecert already Exists
                var keyExists = _IClientKeys.IsUniqueKeyAlreadyGenerate(Convert.ToInt32(Session["UserID"]));

                if (keyExists)
                {
                    // Getting Generate ClientID and ClientSecert Key By UserID
                    clientkeys = _IClientKeys.GetGenerateUniqueKeyByUserID(Convert.ToInt32(Session["UserID"]));
                }
                else
                {
                    string clientID=string.Empty;
                    string clientSecert = string.Empty;
                    int companyId = 0;

                   // var company = d.FindCompanyByUserId(Convert.ToInt32(Session["UserID"]));
                    companyId = 1;

                    //Generate Keys
                    _IClientKeys.GenerateUniqueKey(out clientID, out clientSecert);

                    //Saving Keys Details in Database
                    clientkeys.ClientKeyID = 0;
                    clientkeys.CompanyID = companyId;
                    clientkeys.CreateOn = DateTime.Now;
                    clientkeys.ClientID = clientID;
                    clientkeys.ClientSecret = clientSecert;
                    clientkeys.UserID = Convert.ToInt32(Session["UserID"]);
                    _IClientKeys.SaveClientIDandClientSecert(clientkeys);

                }

                return View(clientkeys);
            }
            catch (Exception)
            {
                throw;
            }
        }

        // POST: ApplicationKeys/GenerateKeys
        [HttpPost]
        public ActionResult GenerateKeys(ClientKey clientkeys)
        {
            try
            {
                string clientID = string.Empty;
                string clientSecert = string.Empty;

                //Generate Keys
                _IClientKeys.GenerateUniqueKey(out clientID, out clientSecert);

                //Updating ClientID and ClientSecert 
                //var company = _IRegisterCompany.FindCompanyByUserId(Convert.ToInt32(Session["UserID"]));
                clientkeys.CompanyID = 1;
                clientkeys.CreateOn = DateTime.Now;
                clientkeys.ClientID = clientID;
                clientkeys.ClientSecret = clientSecert;
                clientkeys.UserID = Convert.ToInt32(Session["UserID"]);
                _IClientKeys.UpdateClientIDandClientSecert(clientkeys);

                return RedirectToAction("GenerateKeys");
            }
            catch 
            {
                return View();
            }
        }


    }
}
