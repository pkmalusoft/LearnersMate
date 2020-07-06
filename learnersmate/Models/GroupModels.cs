using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace learnersmate.Models
{
    public class errordata
    {
        public string message { get; set; }
        public string type { get; set; }
    }
    public class apiheaderdata
    {
        public int UserID { get; set; }
        public int RoleID { get; set; }
        public int SchoolID { get; set; }
        public int AcademicYearID { get; set; }
    }
    public class SuperAdminDashboard
    {
        [Display(Name = "Schools")]
        public int SchoolsCount { get; set; }
        [Display(Name = "Teachers")]
        public int TeachersCount { get; set; }
        [Display(Name = "Parents")]
        public int ParentsCount { get; set; }
        [Display(Name = "Students")]
        public int StudentsCount { get; set; }
        [Display(Name = "Employees")]
        public int EmployeesCount { get; set; }
    }
    public class LogoViewModel
    {
        public HttpPostedFileWrapper ImageFile { get; set; }
    }
    public class UserModel
    {        
        public int UserID { get; set; }

        [Required]
        [Display(Name = "Email")]
        [EmailAddress]
        [MaxLength(100, ErrorMessage = "Email cannot be Greater than 100 Charaters")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        [MaxLength(20, ErrorMessage = "Password cannot be Greater than 10 Charaters")]
        public string Password { get; set; }

        [Required]
        [Display(Name = "Role")]
        public int RoleID { get; set; }

        [Display(Name = "Can Create")]
        public bool CanCreate { get; set; }

        [Display(Name = "Can Edit")]
        public bool CanEdit { get; set; }

        [Display(Name = "Can Delete")]
        public bool CanDelete { get; set; }

        [Display(Name = "Can Print")]
        public bool CanPrint { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }
    }
    public class tempBalanceSheet
    {
        public string fromdate { get; set; }
        public string todate { get; set; }
    }
    public class tempLedger
    {
        public string fromdate { get; set; }
        public string todate { get; set; }
        public string acheadid { get; set; }

    }
    public class tempProfitAndLoss
    {
        public string fromdate { get; set; }
        public string todate { get; set; }
    }
    public class tempTrialBalance
    {
        public string fromdate { get; set; }
        public string todate { get; set; }
    }
    public class tempBankVoucher
    {
        public int bankvoucherid { get; set; }
        public string voucherno { get; set; }
        public DateTime voucherdate { get; set; }
        public int vouchertypeid { get; set; }
        public int employeeid { get; set; }
        public int accountheadid { get; set; }
        public string referenceno { get; set; }
        public DateTime referencedate { get; set; }
        public string narration { get; set; }
        public string totalamount { get; set; }
    }
    public class temptempBankVoucherList
    {
        public List<tempBankVoucher> tempBankVouchers { get; set; }
    }
    public class tempBankVoucherDetail
    {
        public int bankvoucherdetailid { get; set; }
        public int bankvoucherid { get; set; }
        public int accountheadid { get; set; }
        public string amount { get; set; }
        public string remarks { get; set; }
    }
    public class temptempBankVoucherDetailList
    {
        public List<tempBankVoucherDetail> tempBankVoucherDetails { get; set; }
    }
    public class BankVoucherBankVoucherDetailBankVoucherDetailAllocationModel
    {
        public IEnumerable<BankVoucher> BankVouchers { get; set; }
        public IEnumerable<BankVoucherDetail> BankVoucherDetails { get; set; }
    }
    public class tempCashVoucher
    {
        public int cashvoucherid { get; set; }
        public string voucherno { get; set; }
        public DateTime voucherdate { get; set; }
        public int vouchertypeid { get; set; }
        public int employeeid { get; set; }
        public int accountheadid { get; set; }
        public string referenceno { get; set; }
        public DateTime referencedate { get; set; }
        public string narration { get; set; }
        public string totalamount { get; set; }
    }
    public class temptempCashVoucherList
    {
        public List<tempCashVoucher> tempCashVouchers { get; set; }
    }
    public class tempCashVoucherDetail
    {
        public int cashvoucherdetailid { get; set; }
        public int cashvoucherid { get; set; }
        public int accountheadid { get; set; }
        public string amount { get; set; }
        public string remarks { get; set; }
    }
    public class temptempCashVoucherDetailList
    {
        public List<tempCashVoucherDetail> tempCashVoucherDetails { get; set; }
    }
    public class CashVoucherCashVoucherDetailCashVoucherDetailAllocationModel
    {
        public IEnumerable<CashVoucher> CashVouchers { get; set; }
        public IEnumerable<CashVoucherDetail> CashVoucherDetails { get; set; }
    }
    public class tempJournalVoucher
    {
        public int journalvoucherid { get; set; }
        public string voucherno { get; set; }
        public DateTime voucherdate { get; set; }
        public string narration { get; set; }
    }
    public class temptempJournalVoucherList
    {
        public List<tempJournalVoucher> tempJournalVouchers { get; set; }
    }
    public class tempJournalVoucherDetail
    {
        public int journalvoucherdetailid { get; set; }
        public int journalvoucherid { get; set; }
        public int accountheadid { get; set; }
        public int debitcreditid { get; set; }
        public string amount { get; set; }
        public string remarks { get; set; }
    }
    public class temptempJournalVoucherDetailList
    {
        public List<tempJournalVoucherDetail> tempJournalVoucherDetails { get; set; }
    }
    public class JournalVoucherJournalVoucherDetailJournalVoucherDetailAllocationModel
    {
        public IEnumerable<JournalVoucher> JournalVouchers { get; set; }
        public IEnumerable<JournalVoucherDetail> JournalVoucherDetails { get; set; }
    }
    public class tempPostDatedCheque
    {
        public int postdatedchequeid { get; set; }
        public string postpatedchequevoucherno { get; set; }
        public DateTime transactiondate { get; set; }
        public int vouchertypeid { get; set; }
        public int bankid { get; set; }
        public string payersbank { get; set; }
        public string chequeno { get; set; }
        public DateTime chequedate { get; set; }
        public string totalamount { get; set; }
        public string remarks { get; set; }
    }
    public class temptempPostDatedChequeList
    {
        public List<tempPostDatedCheque> tempPostDatedCheques { get; set; }
    }
    public class tempPostDatedChequeDetail
    {
        public int postdatedchequedetailid { get; set; }
        public int postdatedchequeid { get; set; }
        public int receivedfromid { get; set; }
        public int accountheadid { get; set; }
        public string amount { get; set; }
        public string remarks { get; set; }
    }
    public class temptempPostDatedChequeDetailList
    {
        public List<tempPostDatedChequeDetail> tempPostDatedChequeDetails { get; set; }
    }
    public class PostDatedChequePostDatedChequeDetailPostDatedChequeDetailAllocationModel
    {
        public IEnumerable<PostDatedCheque> PostDatedCheques { get; set; }
        public IEnumerable<PostDatedChequeDetail> PostDatedChequeDetails { get; set; }
    }
    public class tempPurchaseInvoice
    {
        public int purchaseinvoiceid { get; set; }
        public string InvoiceNo { get; set; }
        public DateTime invoicedate { get; set; }
        public int supplierid { get; set; }
        public string externalreference { get; set; }
        public string quotationnodate { get; set; }
        public string lponodate { get; set; }
        public int currencyid { get; set; }
        public int employeeid { get; set; }
        public decimal grosstotalamount { get; set; }
        public int discounttypeid { get; set; }
        public decimal discount { get; set; }
        public decimal vatamount { get; set; }
        public decimal nettotalamount { get; set; }
        public string remarks { get; set; }
    }
    public class temptempPurchaseInvoiceList
    {
        public List<tempPurchaseInvoice> tempPurchaseInvoices { get; set; }
    }
    public class tempPurchaseInvoiceDetail
    {
        public int purchaseinvoicedetailid { get; set; }
        public string Description { get; set; }
        public int purchaseinvoiceid { get; set; }
        public int Quantity { get; set; }
        public int purchaseinvoicedetailunit { get; set; }
        public decimal Rate { get; set; }
        public decimal Ratefc { get; set; }
        public decimal DetailValue { get; set; }
        public decimal DetailValuefc { get; set; }
        public int Tax { get; set; }
        public decimal NetValue { get; set; }
        public int accountheadid { get; set; }
        public string DetailJob { get; set; }
        public string ProductsServices { get; set; }
    }
    public class temptempPurchaseInvoiceDetailList
    {
        public List<tempPurchaseInvoiceDetail> tempPurchaseInvoiceDetails { get; set; }
    }
    public class PurchaseInvoicePurchaseInvoiceDetailPurchaseInvoiceDetailAllocationModel
    {
        public IEnumerable<PurchaseInvoice> PurchaseInvoices { get; set; }
        public IEnumerable<PurchaseInvoiceDetail> PurchaseInvoiceDetails { get; set; }
    }
    public class tempWeek
    {
        public string Month { get; set; }
        public string MonthYear { get; set; }

    }
    public class tempWeekDetail
    {
        public List<tempWeek> tempWeekDetails { get; set; }
    }  
    public class tempAcHeadAssigns
    {
        public int id { get; set; }
        public int acheadid { get; set; }
    }
    public class temptempAcHeadAssignsList
    {
        public List<tempAcHeadAssigns> tempAcHeadAssignss { get; set; }
    }

    public class SchoolModel
    {
        public int SchoolID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Short Name")]
        [MaxLength(6)]
        public string ShortName { get; set; }

        [Display(Name = "House No")]
        [MaxLength(500)]
        public string HouseNo { get; set; }

        [Display(Name = "Building")]
        [MaxLength(500)]
        public string BuildingName { get; set; }

        [Display(Name = "Street")]
        [MaxLength(500)]
        public string Street { get; set; }

        [Display(Name = "Area")]
        [MaxLength(500)]
        public string Area { get; set; }

        [Display(Name = "Location")]
        [MaxLength(500)]
        public string Location { get; set; }

        [Required]
        [Display(Name = "City")]
        public int CityID { get; set; }

        [Required]
        [Display(Name = "Country")]
        public int CountryID { get; set; }

        [Display(Name = "Pin Code")]
        [MaxLength(50)]
        public string PinCode { get; set; }

        [Display(Name = "Landline")]
        [MaxLength(50)]
        public string Landline { get; set; }

        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }


        [Display(Name = "Website")]
        [MaxLength(500)]
        public string Website { get; set; }

        [Display(Name = "Registeration No")]
        [MaxLength(500)]
        public string RegNo { get; set; }

        [Display(Name = "Logo")]
        [MaxLength(4000)]
        public string Logo { get; set; }

        [Required]
        [Display(Name = "Principal")]
        [MaxLength(100)]
        public string Principal { get; set; }

        [Required]
        [Display(Name = "User ID")]
        public int UserID { get; set; }

        [Required]
        [Display(Name = "Academic Year ID")]
        public int CompanyAcademicYearID { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Email")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [MaxLength(100)]
        public string Password { get; set; }

    }
    public class SchoolModelApi
    {
        public int SchoolID { get; set; }
       
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }
       
        [Display(Name = "Short Name")]
        [MaxLength(6)]
        public string ShortName { get; set; }

        [Display(Name = "House No")]
        [MaxLength(500)]
        public string HouseNo { get; set; }

        [Display(Name = "Building")]
        [MaxLength(500)]
        public string BuildingName { get; set; }

        [Display(Name = "Street")]
        [MaxLength(500)]
        public string Street { get; set; }

        [Display(Name = "Area")]
        [MaxLength(500)]
        public string Area { get; set; }

        [Display(Name = "Location")]
        [MaxLength(500)]
        public string Location { get; set; }

        [Display(Name = "City")]
        public string City { get; set; }
      
        [Display(Name = "Country")]
        public string Country { get; set; }

        [Display(Name = "Pin Code")]
        [MaxLength(50)]
        public string PinCode { get; set; }

        [Display(Name = "Landline")]
        [MaxLength(50)]
        public string Landline { get; set; }

        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }

        [Display(Name = "Website")]
        [MaxLength(500)]
        public string Website { get; set; }

        [Display(Name = "Registration No")]
        [MaxLength(500)]
        public string RegNo { get; set; }

        [Display(Name = "Logo")]
        [MaxLength(4000)]
        public string Logo { get; set; }
        [Required]
        [Display(Name = "Principal")]
        [MaxLength(100)]
        public string Principal { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Email")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [MaxLength(100)]
        public string Password { get; set; }

    }
    public class TeacherModel
    {
        public int TeacherID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Display(Name = "Id Card")]
        [MaxLength(100)]
        public string IdCard { get; set; }

        [Display(Name = "House No")]
        [MaxLength(500)]
        public string HouseNo { get; set; }

        [Display(Name = "Building")]
        [MaxLength(500)]
        public string BuildingName { get; set; }

        [Display(Name = "Street")]
        [MaxLength(500)]
        public string Street { get; set; }

        [Display(Name = "Area")]
        [MaxLength(500)]
        public string Area { get; set; }

        [Display(Name = "Location")]
        [MaxLength(500)]
        public string Location { get; set; }

        [Required]
        [Display(Name = "City")]
        public int CityID { get; set; }

        [Required]
        [Display(Name = "Country")]
        public int CountryID { get; set; }

        [Display(Name = "Pin Code")]
        [MaxLength(50)]
        public string PinCode { get; set; }

        [Display(Name = "Landline")]
        [MaxLength(50)]
        public string Landline { get; set; }

        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }


        [Display(Name = "Photo")]
        [MaxLength(4000)]
        public string Photo { get; set; }

        [Required]
        [Display(Name = "School")]
        public int SchoolID { get; set; }

        [Required]
        [Display(Name = "User ID")]
        public int UserID { get; set; }

        [Required]
        [Display(Name = "Leaves To Avail")]
        public int LeavesToAvail { get; set; }

        [Required]
        [Display(Name = "Salary")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Salary { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Email")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [MaxLength(100)]
        public string Password { get; set; }

    }
    public class TeacherModelApi
    {
        public int TeacherID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Display(Name = "Id Card")]
        [MaxLength(100)]
        public string IdCard { get; set; }

        [Display(Name = "House No")]
        [MaxLength(500)]
        public string HouseNo { get; set; }

        [Display(Name = "Building")]
        [MaxLength(500)]
        public string BuildingName { get; set; }

        [Display(Name = "Street")]
        [MaxLength(500)]
        public string Street { get; set; }

        [Display(Name = "Area")]
        [MaxLength(500)]
        public string Area { get; set; }

        [Display(Name = "Location")]
        [MaxLength(500)]
        public string Location { get; set; }
     
        [Display(Name = "City")]
        public string City { get; set; }
       
        [Display(Name = "Country")]
        public string Country { get; set; }

        [Display(Name = "Pin Code")]
        [MaxLength(50)]
        public string PinCode { get; set; }

        [Display(Name = "Landline")]
        [MaxLength(50)]
        public string Landline { get; set; }

        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }

        [Display(Name = "Photo")]
        [MaxLength(4000)]
        public string Photo { get; set; }

        [Required]
        [Display(Name = "School")]
        public string School { get; set; }

        [Display(Name = "Leaves To Avail")]
        public int LeavesToAvail { get; set; }
      
        [Display(Name = "Salary")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Salary { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Email")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [MaxLength(100)]
        public string Password { get; set; }

    }
    public class ParentModel
    {
        public int ParentID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Display(Name = "House No")]
        [MaxLength(500)]
        public string HouseNo { get; set; }

        [Display(Name = "Building")]
        [MaxLength(500)]
        public string BuildingName { get; set; }

        [Display(Name = "Street")]
        [MaxLength(500)]
        public string Street { get; set; }

        [Display(Name = "Area")]
        [MaxLength(500)]
        public string Area { get; set; }

        [Display(Name = "Location")]
        [MaxLength(500)]
        public string Location { get; set; }

        [Required]
        [Display(Name = "City")]
        public int CityID { get; set; }

        [Required]
        [Display(Name = "Country")]
        public int CountryID { get; set; }

        [Display(Name = "Pin Code")]
        [MaxLength(50)]
        public string PinCode { get; set; }

        [Display(Name = "Landline")]
        [MaxLength(50)]
        public string Landline { get; set; }

        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }


        [Display(Name = "Photo")]
        [MaxLength(4000)]
        public string Photo { get; set; }

        [Required]
        [Display(Name = "School")]
        public int SchoolID { get; set; }


        [Required]
        [Display(Name = "User ID")]
        public int UserID { get; set; }


        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Email")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [MaxLength(100)]
        public string Password { get; set; }

    }
    public class ParentModelApi
    {
        public int ParentID { get; set; }
       
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Display(Name = "House No")]
        [MaxLength(500)]
        public string HouseNo { get; set; }

        [Display(Name = "Building")]
        [MaxLength(500)]
        public string BuildingName { get; set; }

        [Display(Name = "Street")]
        [MaxLength(500)]
        public string Street { get; set; }

        [Display(Name = "Area")]
        [MaxLength(500)]
        public string Area { get; set; }

        [Display(Name = "Location")]
        [MaxLength(500)]
        public string Location { get; set; }
       
        [Display(Name = "City")]
        public string City { get; set; }
       
        [Display(Name = "Country")]
        public string Country { get; set; }

        [Display(Name = "Pin Code")]
        [MaxLength(50)]
        public string PinCode { get; set; }

        [Display(Name = "Landline")]
        [MaxLength(50)]
        public string Landline { get; set; }

        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }

        [Display(Name = "Photo")]
        [MaxLength(4000)]
        public string Photo { get; set; }

        [Display(Name = "School")]
        public string School { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Email")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [MaxLength(100)]
        public string Password { get; set; }

    }
    public class ParentJsonModel
    {
        public int Id { set; get; }
        public string ParentName { get; set; }
        public string ParentHouseNo { get; set; }
        public string ParentBuildingName { get; set; }
        public string ParentStreet { get; set; }
        public string ParentArea { get; set; }
        public string ParentLocation { get; set; }
        public string ParentCity { get; set; }
        public string ParentCountry { get; set; }
        public string ParentPinCode { get; set; }
        public string ParentLandline { get; set; }
        public string ParentMobile { get; set; }
        public string ParentEmail { get; set; }
    }
    public class StudentModel
    {
        public int StudentID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Display(Name = "Id Card")]
        [MaxLength(100)]
        public string IdCard { get; set; }

        [Required]
        [Display(Name = "Date Of Birth")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> Dob { get; set; }

        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }

        [Required]
        [Display(Name = "Class")]
        public int ClassID { get; set; }

        [Required]
        [Display(Name = "Section")]
        public int SectionID { get; set; }

        [Display(Name = "School Name")]
        [MaxLength(100)]
        public string SchoolName { get; set; }

        [Display(Name = "Parent Name")]
        [MaxLength(100)]
        public string ParentName { get; set; }

        [Display(Name = "Parent House No")]
        [MaxLength(500)]
        public string ParentHouseNo { get; set; }

        [Display(Name = "Parent Building")]
        [MaxLength(500)]
        public string ParentBuildingName { get; set; }

        [Display(Name = "Parent Street")]
        [MaxLength(500)]
        public string ParentStreet { get; set; }

        [Display(Name = "Parent Area")]
        [MaxLength(500)]
        public string ParentArea { get; set; }

        [Display(Name = "Parent Location")]
        [MaxLength(500)]
        public string ParentLocation { get; set; }

        [Display(Name = "Parent City")]
        public string ParentCity { get; set; }

        [Display(Name = "Parent Country")]
        public string ParentCountry { get; set; }

        [Display(Name = "Parent Pin Code")]
        [MaxLength(50)]
        public string ParentPinCode { get; set; }

        [Display(Name = "Parent Landline")]
        [MaxLength(50)]
        public string ParentLandline { get; set; }

        [Display(Name = "Parent Mobile")]
        [MaxLength(100)]
        public string ParentMobile { get; set; }

        [Display(Name = "Parent Email")]
        [MaxLength(100)]
        public string ParentEmail { get; set; }

        [Display(Name = "Guardian")]
        [MaxLength(100)]
        public string GuardianName { get; set; }

        [Display(Name = "Guardian Mobile")]
        [MaxLength(100)]
        public string GuardianMobile { get; set; }

        [Display(Name = "Guardian Email")]
        [MaxLength(100)]
        public string GuardianEmail { get; set; }

        [Display(Name = "Parent 2")]
        [MaxLength(100)]
        public string Parent2Name { get; set; }

        [Display(Name = "Parent 2 Mobile")]
        [MaxLength(100)]
        public string Parent2Mobile { get; set; }

        [Display(Name = "Parent 2 Email")]
        [MaxLength(100)]
        public string Parent2Email { get; set; }

        [Display(Name = "Photo")]
        [MaxLength(4000)]
        public string Photo { get; set; }

        [Required]
        [Display(Name = "School")]
        public int SchoolID { get; set; }

        [Required]
        [Display(Name = "Parent")]
        public int ParentID { get; set; }

        [Required]
        [Display(Name = "User ID")]
        public int UserID { get; set; }

        [Required]
        [Display(Name = "Fees")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Fee { get; set; }

        [Required]
        [Display(Name = "Fee Instalments")]
        public int FeeInstalments { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Email")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [MaxLength(100)]
        public string Password { get; set; }

    }
    public class StudentModelApi
    {
        public int StudentID { get; set; }
      
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Display(Name = "Id Card")]
        [MaxLength(100)]
        public string IdCard { get; set; }
       
        [Display(Name = "Date Of Birth")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<DateTime> Dob { get; set; }

        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }
       
        [Display(Name = "Class")]
        public string Class { get; set; }

        [Required]
        [Display(Name = "Section")]
        public string Section { get; set; }

        [Display(Name = "School Name")]
        [MaxLength(100)]
        public string SchoolName { get; set; }

        [Display(Name = "Parent Name")]
        [MaxLength(100)]
        public string ParentName { get; set; }

        [Display(Name = "Parent House No")]
        [MaxLength(500)]
        public string ParentHouseNo { get; set; }

        [Display(Name = "Parent Building")]
        [MaxLength(500)]
        public string ParentBuildingName { get; set; }

        [Display(Name = "Parent Street")]
        [MaxLength(500)]
        public string ParentStreet { get; set; }

        [Display(Name = "Parent Area")]
        [MaxLength(500)]
        public string ParentArea { get; set; }

        [Display(Name = "Parent Location")]
        [MaxLength(500)]
        public string ParentLocation { get; set; }

        [Display(Name = "Parent City")]
        public string ParentCity { get; set; }

        [Display(Name = "Parent Country")]
        public string ParentCountry { get; set; }

        [Display(Name = "Parent Pin Code")]
        [MaxLength(50)]
        public string ParentPinCode { get; set; }

        [Display(Name = "Parent Landline")]
        [MaxLength(50)]
        public string ParentLandline { get; set; }

        [Display(Name = "Parent Mobile")]
        [MaxLength(100)]
        public string ParentMobile { get; set; }

        [Display(Name = "Parent Email")]
        [MaxLength(100)]
        public string ParentEmail { get; set; }

        [Display(Name = "Guardian")]
        [MaxLength(100)]
        public string GuardianName { get; set; }

        [Display(Name = "Guardian Mobile")]
        [MaxLength(100)]
        public string GuardianMobile { get; set; }

        [Display(Name = "Guardian Email")]
        [MaxLength(100)]
        public string GuardianEmail { get; set; }

        [Display(Name = "Parent 2")]
        [MaxLength(100)]
        public string Parent2Name { get; set; }

        [Display(Name = "Parent 2 Mobile")]
        [MaxLength(100)]
        public string Parent2Mobile { get; set; }

        [Display(Name = "Parent 2 Email")]
        [MaxLength(100)]
        public string Parent2Email { get; set; }

        [Display(Name = "Photo")]
        [MaxLength(4000)]
        public string Photo { get; set; }
      
        [Display(Name = "Fees")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Fee { get; set; }

        [Display(Name = "Fee Instalments")]
        public int FeeInstalments { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Email")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [MaxLength(100)]
        public string Password { get; set; }

    }
    public class EmployeeModel
    {
        public int EmployeeID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Display(Name = "Id Card")]
        [MaxLength(100)]
        public string IdCard { get; set; }

        [Display(Name = "House No")]
        [MaxLength(500)]
        public string HouseNo { get; set; }

        [Display(Name = "Building")]
        [MaxLength(500)]
        public string BuildingName { get; set; }

        [Display(Name = "Street")]
        [MaxLength(500)]
        public string Street { get; set; }

        [Display(Name = "Area")]
        [MaxLength(500)]
        public string Area { get; set; }

        [Display(Name = "Location")]
        [MaxLength(500)]
        public string Location { get; set; }

        [Required]
        [Display(Name = "City")]
        public int CityID { get; set; }

        [Required]
        [Display(Name = "Country")]
        public int CountryID { get; set; }

        [Display(Name = "Pin Code")]
        [MaxLength(50)]
        public string PinCode { get; set; }

        [Display(Name = "Landline")]
        [MaxLength(50)]
        public string Landline { get; set; }

        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }

        [Display(Name = "Photo")]
        [MaxLength(4000)]
        public string Photo { get; set; }

        [Required]
        [Display(Name = "School")]
        public int SchoolID { get; set; }

        [Required]
        [Display(Name = "User ID")]
        public int UserID { get; set; }

        [Required]
        [Display(Name = "Leaves To Avail")]
        public int LeavesToAvail { get; set; }

        [Required]
        [Display(Name = "Salary")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Salary { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Email")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [MaxLength(100)]
        public string Password { get; set; }

    }
    public class EmployeeModelApi
    {
        public int EmployeeID { get; set; }
      
        [Display(Name = "Name")]
        [MaxLength(100)]
        public string Name { get; set; }

        [Display(Name = "Id Card")]
        [MaxLength(100)]
        public string IdCard { get; set; }

        [Display(Name = "House No")]
        [MaxLength(500)]
        public string HouseNo { get; set; }

        [Display(Name = "Building")]
        [MaxLength(500)]
        public string BuildingName { get; set; }

        [Display(Name = "Street")]
        [MaxLength(500)]
        public string Street { get; set; }

        [Display(Name = "Area")]
        [MaxLength(500)]
        public string Area { get; set; }

        [Display(Name = "Location")]
        [MaxLength(500)]
        public string Location { get; set; }

        [Required]
        [Display(Name = "City")]
        public string City { get; set; }

        [Required]
        [Display(Name = "Country")]
        public string Country { get; set; }

        [Display(Name = "Pin Code")]
        [MaxLength(50)]
        public string PinCode { get; set; }

        [Display(Name = "Landline")]
        [MaxLength(50)]
        public string Landline { get; set; }

        [Display(Name = "Mobile No")]
        [MaxLength(100)]
        public string Mobile { get; set; }

        [Display(Name = "Photo")]
        [MaxLength(4000)]
        public string Photo { get; set; }

        [Required]
        [Display(Name = "School")]
        public string School { get; set; }
     
        [Display(Name = "Leaves To Avail")]
        public int LeavesToAvail { get; set; }
    
        [Display(Name = "Salary")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal Salary { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }

        [Display(Name = "Email")]
        [MaxLength(100)]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [MaxLength(100)]
        public string Password { get; set; }

    }
    public class PeriodJsonModel
    {
        public int Id { set; get; }
        public string Time { get; set; }
    }
    public class ExamMultiModel
    {
        public IEnumerable<Exam> Exams { get; set; }
        public IEnumerable<ExamPortion> ExamPortions { get; set; }
    }
    public class ExamModel
    {
        [Display(Name = "ID")]
        public int ExamID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Required]
        [Display(Name = "School")]
        public int SchoolID { get; set; }

        [Required]
        [Display(Name = "Subject")]
        public int SubjectID { get; set; }


        [MaxLength(100)]
        [Display(Name = "Subject Name")]
        public string SubjectName { get; set; }

        [Required]
        [Display(Name = "Date")]
        public Nullable<DateTime> Date { get; set; }

        [Required]
        [Display(Name = "Exam Portion")]
        public int ExamPortionID { get; set; }

        [Required]
        [Display(Name = "Chapter")]
        public int ChapterID { get; set; }

        [MaxLength(100)]
        [Display(Name = "Chapter Name")]
        public string ChapterName { get; set; }

        [Required]
        [Display(Name = "Topic")]
        public int TopicID { get; set; }

        [MaxLength(100)]
        [Display(Name = "Topic Name")]
        public string TopicName { get; set; }

        [Display(Name = "Remarks")]
        [MaxLength(1000)]
        public string Remarks { get; set; }
    }
    public class examportionmodel
    {
        public int examid { get; set; }
        public int chapterid { get; set; }
        public int topicid { get; set; }

    }
    public class examportionmodelList
    {
        public List<examportionmodel> examportionmodels { get; set; }
    }
    public class TeacherAttendanceModel
    {
        [Display(Name = "ID")]
        public int TeacherAttendanceID { get; set; }

        [Display(Name = "Teacher ID")]
        public int TeacherID { get; set; }

        [Display(Name = "Teacher")]
        [MaxLength(100)]
        public string TeacherName { get; set; }

        [Display(Name = "Attendance Type")]
        public int AttendanceTypeID { get; set; }

        [Display(Name = "Back Day 1")]
        [MaxLength(100)]
        public string BackDay1 { get; set; }

        [Display(Name = "Back Day 2")]
        [MaxLength(100)]
        public string BackDay2 { get; set; }

        [Display(Name = "Back Day 3")]
        [MaxLength(100)]
        public string BackDay3 { get; set; }

        [Display(Name = "Back Day 4")]
        [MaxLength(100)]
        public string BackDay4 { get; set; }

        [Display(Name = "Back Day 5")]
        [MaxLength(100)]
        public string BackDay5 { get; set; }

        [Display(Name = "Back Day 6")]
        [MaxLength(100)]
        public string BackDay6 { get; set; }

        [Display(Name = "Present")]
        public int Present { get; set; }

        [Display(Name = "Absent")]
        public int Absent { get; set; }

        [Display(Name = "Leave")]
        public int Leave { get; set; }

    }
    public class TempTeacherAttendance
    {
        public int id { get; set; }
        public int attendancetypeid { get; set; }
    }
    public class TempTeacherAttendanceList
    {
        public List<TempTeacherAttendance> TempTeacherAttendances { get; set; }
    }
    public class StudentAttendanceModel
    {
        [Display(Name = "ID")]
        public int StudentAttendanceID { get; set; }

        [Display(Name = "Student ID")]
        public int StudentID { get; set; }

        [Display(Name = "Class ID")]
        public int ClassID { get; set; }

        [Display(Name = "Section ID")]
        public int SectionID { get; set; }

        [Display(Name = "Class")]
        public string Class { get; set; }

        [Display(Name = "Section")]
        public string Section { get; set; }

        [Display(Name = "Id Card")]
        [MaxLength(100)]
        public string IdCard { get; set; }

        [Display(Name = "Student")]
        [MaxLength(100)]
        public string StudentName { get; set; }

        [Display(Name = "Attendance Type")]
        public int AttendanceTypeID { get; set; }

        [Display(Name = "Back Day 1")]
        [MaxLength(100)]
        public string BackDay1 { get; set; }

        [Display(Name = "Back Day 2")]
        [MaxLength(100)]
        public string BackDay2 { get; set; }

        [Display(Name = "Back Day 3")]
        public string BackDay3 { get; set; }

        [Display(Name = "Back Day 4")]
        [MaxLength(100)]
        public string BackDay4 { get; set; }

        [Display(Name = "Back Day 5")]
        [MaxLength(100)]
        public string BackDay5 { get; set; }

        [Display(Name = "Back Day 6")]
        [MaxLength(100)]
        public string BackDay6 { get; set; }

        [Display(Name = "%")]
        public decimal Percentage { get; set; }

    }
    public class TempStudentAttendance
    {
        public int id { get; set; }
        public int attendancetypeid { get; set; }
    }
    public class TempStudentAttendanceList
    {
        public List<TempStudentAttendance> TempStudentAttendances { get; set; }
    }
    public class EmployeeAttendanceModel
    {
        [Display(Name = "ID")]
        public int EmployeeAttendanceID { get; set; }

        [Display(Name = "Employee ID")]
        public int EmployeeID { get; set; }

        [Display(Name = "Employee")]
        [MaxLength(100)]
        public string EmployeeName { get; set; }

        [Display(Name = "Attendance Type")]
        public int AttendanceTypeID { get; set; }

        [Display(Name = "Back Day 1")]
        [MaxLength(100)]
        public string BackDay1 { get; set; }

        [Display(Name = "Back Day 2")]
        [MaxLength(100)]
        public string BackDay2 { get; set; }

        [Display(Name = "Back Day 3")]
        [MaxLength(100)]
        public string BackDay3 { get; set; }

        [Display(Name = "Back Day 4")]
        [MaxLength(100)]
        public string BackDay4 { get; set; }

        [Display(Name = "Back Day 5")]
        [MaxLength(100)]
        public string BackDay5 { get; set; }

        [Display(Name = "Back Day 6")]
        [MaxLength(100)]
        public string BackDay6 { get; set; }

        [Display(Name = "Present")]
        public int Present { get; set; }

        [Display(Name = "Absent")]
        public int Absent { get; set; }

        [Display(Name = "Leave")]
        public int Leave { get; set; }

    }
    public class TempEmployeeAttendance
    {
        public int id { get; set; }
        public int attendancetypeid { get; set; }
    }
    public class TempEmployeeAttendanceList
    {
        public List<TempEmployeeAttendance> TempEmployeeAttendances { get; set; }
    }
    public class PublicHoliday
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Desc { get; set; }
        public string Start_Date { get; set; }
        public string End_Date { get; set; }
    }
    public class HolidayModel
    {
        [Display(Name = "ID")]
        public int CalendarID { get; set; }

        [Required]
        [MaxLength(100)]
        [Display(Name = "Title")]
        public string Title { get; set; }

        [Required]
        [MaxLength(250)]
        [Display(Name = "Description")]
        public string Description { get; set; }

        [Required]
        [Display(Name = "StartDate")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime StartDate { get; set; }

        [Required]
        [Display(Name = "No Of Days")]
        public int NoOfDays { get; set; }

    }
}