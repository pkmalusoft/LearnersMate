using learnersmate.Models;
using System.Data.Entity;

namespace learnersmate.Context
{
    public class DatabaseContext : DbContext
    {
        public DatabaseContext() : base("DefaultConnection")
        {
        }

        public DbSet<AccountBank> AccountBanks { get; set; }
        public DbSet<AccountCategory> AccountCategorys { get; set; }
        public DbSet<AccountGroup> AccountGroups { get; set; }
        public DbSet<AccountHead> AccountHeads { get; set; }
        public DbSet<AccountHeadAssign> AccountHeadAssigns { get; set; }
        public DbSet<AccountJournal> AccountJournals { get; set; }
        public DbSet<AccountJournalDetail> AccountJournalDetails { get; set; }
        public DbSet<AccountOpening> AccountOpenings { get; set; }
        public DbSet<AllocationGroup> AllocationGroups { get; set; }
        public DbSet<AllocationType> AllocationTypes { get; set; }       
        public DbSet<AnalysisGroup> AnalysisGroups { get; set; }
        public DbSet<AnalysisHead> AnalysisHeads { get; set; }
        public DbSet<Bank> Banks { get; set; }
        public DbSet<BankDepositStatus> BankDepositStatuses { get; set; }
        public DbSet<BankVoucher> BankVouchers { get; set; }
        public DbSet<BankVoucherDetail> BankVoucherDetails { get; set; }
        public DbSet<BankVoucherDetailAllocation> BankVoucherDetailAllocations { get; set; }
        public DbSet<CashBook> CashBooks { get; set; }
        public DbSet<CashVoucher> CashVouchers { get; set; }
        public DbSet<CashVoucherDetail> CashVoucherDetails { get; set; }
        public DbSet<CashVoucherDetailAllocation> CashVoucherDetailAllocations { get; set; }        
        public DbSet<ChequeStatus> ChequeStatuses { get; set; }
        public DbSet<ClientKey> ClientKeys { get; set; }
        public DbSet<DayBook2> DayBooks2 { get; set; }
        public DbSet<DebitCredit> DebitCredits { get; set; }
        public DbSet<DiscountType> DiscountTypes { get; set; }
        public DbSet<ExceptionLogger> ExceptionLoggers { get; set; }
        public DbSet<Gender> Genders { get; set; }
        public DbSet<JournalVoucher> JournalVouchers { get; set; }
        public DbSet<JournalVoucherDetail> JournalVoucherDetails { get; set; }
        public DbSet<JournalVoucherDetailAllocation> JournalVoucherDetailAllocations { get; set; }
        public DbSet<LedgerBook> LedgerBooks { get; set; }
        public DbSet<MainMenu> MainMenus { get; set; }
        public DbSet<PostDatedCheque> PostDatedCheques { get; set; }
        public DbSet<PostDatedChequeDetail> PostDatedChequeDetails { get; set; }
        public DbSet<PurchaseInvoice> PurchaseInvoices { get; set; }
        public DbSet<PurchaseInvoiceDetail> PurchaseInvoiceDetails { get; set; }
        public DbSet<RevenueType> RevenueTypes { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<SubMenu> SubMenus { get; set; }
        public DbSet<Supplier> Suppliers { get; set; }
        public DbSet<TaskEmployee> TaskEmployees { get; set; }
        public DbSet<TaskList> TaskLists { get; set; }
        public DbSet<TaskPriority> TaskPrioritys { get; set; }
        public DbSet<TaskStatus> TaskStatuss { get; set; }
        public DbSet<TaskType> TaskTypes { get; set; }
        public DbSet<Token> Tokens { get; set; }
        public DbSet<TransactionType> TransactionTypes { get; set; }
        public DbSet<TrialBalance> TrialBalances { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserPagePermission> UserPagePermissions { get; set; }
        public DbSet<UserPageView> UserPageViews { get; set; }
        public DbSet<UserRole> UserRoles { get; set; }
        public DbSet<VoucherType> VoucherTypes { get; set; }
        public DbSet<TokensManager> TokensManager { get; set; }


        public DbSet<AcademicYear> AcademicYears { get; set; }     
        public DbSet<City> Citys { get; set; }
        public DbSet<Country> Countrys { get; set; }
        public DbSet<Currency> Currencys { get; set; }
        public DbSet<Company> Companys { get; set; }
        public DbSet<CompanyAcademicYear> CompanyAcademicYears { get; set; }
        public DbSet<School> Schools { get; set; }
        public DbSet<Teacher> Teachers { get; set; }
        public DbSet<Parent> Parents { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Class> Classes { get; set; }
        public DbSet<Section> Sections { get; set; }
        public DbSet<Subject> Subjects { get; set; }
        public DbSet<Chapter> Chapters { get; set; }
        public DbSet<Topic> Topics { get; set; }
        public DbSet<Period> Periods { get; set; }
        public DbSet<TimeTable> TimeTables { get; set; }
        public DbSet<Exam> Exams { get; set; }
        public DbSet<ExamPortion> ExamPortions { get; set; }
        public DbSet<AttendanceType> AttendanceTypes { get; set; }
        public DbSet<TeacherAttendance> TeacherAttendances { get; set; }
        public DbSet<StudentAttendance> StudentAttendances { get; set; }
        public DbSet<EmployeeAttendance> EmployeeAttendances { get; set; }
        public DbSet<FeeBook> FeeBooks { get; set; }
        public DbSet<SalaryBookTeacher> SalaryBookTeachers { get; set; }
        public DbSet<SalaryBookEmployee> SalaryBookEmployees { get; set; }
        public DbSet<Calendar> Calendars { get; set; }
        public DbSet<Video> Videos { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<NotificationType> NotificationTypes { get; set; }
        public DbSet<NotificationSchool> NotificationSchools { get; set; }
        public DbSet<NotificationTeacher> NotificationTeachers { get; set; }
        public DbSet<NotificationParent> NotificationParents { get; set; }
        public DbSet<NotificationStudent> NotificationStudents { get; set; }
        public DbSet<NotificationEmployee> NotificationEmployees { get; set; }
        public DbSet<StudentAssignment> StudentAssignments { get; set; }
        public DbSet<StudentAssignmentSubmission> StudentAssignmentSubmissions { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {          
            modelBuilder.Entity<User>().HasMany<UserRole>(g => g.UserRoles).WithRequired(s => s.CurrentUser).WillCascadeOnDelete(false);
            modelBuilder.Entity<Role>().HasMany<UserRole>(g => g.UserRoles).WithRequired(s => s.CurrentRole).WillCascadeOnDelete(false);
            modelBuilder.Entity<User>().HasMany<UserPagePermission>(g => g.UserPagePermissions).WithRequired(s => s.CurrentUser).WillCascadeOnDelete(false);
            modelBuilder.Entity<MainMenu>().HasMany<SubMenu>(g => g.SubMenus).WithRequired(s => s.CurrentMainMenu).WillCascadeOnDelete(false);     
            modelBuilder.Entity<TaskType>().HasMany<TaskList>(g => g.TaskLists).WithRequired(s => s.CurrentTaskType).WillCascadeOnDelete(false);
            modelBuilder.Entity<TaskPriority>().HasMany<TaskList>(g => g.TaskLists).WithRequired(s => s.CurrentTaskPriority).WillCascadeOnDelete(false);
            modelBuilder.Entity<TaskStatus>().HasMany<TaskList>(g => g.TaskLists).WithRequired(s => s.CurrentTaskStatus).WillCascadeOnDelete(false);
            modelBuilder.Entity<TaskList>().HasMany<TaskEmployee>(g => g.TaskEmployees).WithRequired(s => s.CurrentTaskList).WillCascadeOnDelete(false);
            modelBuilder.Entity<VoucherType>().HasMany<BankVoucher>(g => g.BankVouchers).WithRequired(s => s.CurrentVoucherType).WillCascadeOnDelete(false);
            modelBuilder.Entity<AllocationGroup>().HasMany<AllocationType>(g => g.AllocationTypes).WithRequired(s => s.CurrentAllocationGroup).WillCascadeOnDelete(false);
            modelBuilder.Entity<VoucherType>().HasMany<BankVoucher>(g => g.BankVouchers).WithRequired(s => s.CurrentVoucherType).WillCascadeOnDelete(false);
            modelBuilder.Entity<BankVoucher>().HasMany<BankVoucherDetail>(g => g.BankVoucherDetails).WithRequired(s => s.CurrentBankVoucher).WillCascadeOnDelete(false);
            modelBuilder.Entity<BankVoucherDetail>().HasMany<BankVoucherDetailAllocation>(g => g.BankVoucherDetailAllocations).WithRequired(s => s.CurrentBankVoucherDetail).WillCascadeOnDelete(false);
            modelBuilder.Entity<AllocationType>().HasMany<BankVoucherDetailAllocation>(g => g.BankVoucherDetailAllocations).WithRequired(s => s.CurrentAllocationType).WillCascadeOnDelete(false);
            modelBuilder.Entity<Employee>().HasMany<CashVoucher>(g => g.CashVouchers).WithRequired(s => s.CurrentEmployee).WillCascadeOnDelete(false);
            modelBuilder.Entity<VoucherType>().HasMany<CashVoucher>(g => g.CashVouchers).WithRequired(s => s.CurrentVoucherType).WillCascadeOnDelete(false);
            modelBuilder.Entity<CashVoucher>().HasMany<CashVoucherDetail>(g => g.CashVoucherDetails).WithRequired(s => s.CurrentCashVoucher).WillCascadeOnDelete(false);
            modelBuilder.Entity<CashVoucherDetail>().HasMany<CashVoucherDetailAllocation>(g => g.CashVoucherDetailAllocations).WithRequired(s => s.CurrentCashVoucherDetail).WillCascadeOnDelete(false);
            modelBuilder.Entity<AllocationType>().HasMany<CashVoucherDetailAllocation>(g => g.CashVoucherDetailAllocations).WithRequired(s => s.CurrentAllocationType).WillCascadeOnDelete(false);
            modelBuilder.Entity<Supplier>().HasMany<PurchaseInvoice>(g => g.PurchaseInvoices).WithRequired(s => s.CurrentSupplier).WillCascadeOnDelete(false);      
            modelBuilder.Entity<PurchaseInvoice>().HasMany<PurchaseInvoiceDetail>(g => g.PurchaseInvoiceDetails).WithRequired(s => s.CurrentPurchaseInvoice).WillCascadeOnDelete(false);
            modelBuilder.Entity<JournalVoucher>().HasMany<JournalVoucherDetail>(g => g.JournalVoucherDetails).WithRequired(s => s.CurrentJournalVoucher).WillCascadeOnDelete(false);
            modelBuilder.Entity<DebitCredit>().HasMany<JournalVoucherDetail>(g => g.JournalVoucherDetails).WithRequired(s => s.CurrentDebitCredit).WillCascadeOnDelete(false);
            modelBuilder.Entity<JournalVoucherDetail>().HasMany<JournalVoucherDetailAllocation>(g => g.JournalVoucherDetailAllocations).WithRequired(s => s.CurrentJournalVoucherDetail).WillCascadeOnDelete(false);
            modelBuilder.Entity<AllocationType>().HasMany<JournalVoucherDetailAllocation>(g => g.JournalVoucherDetailAllocations).WithRequired(s => s.CurrentAllocationType).WillCascadeOnDelete(false);
            modelBuilder.Entity<VoucherType>().HasMany<PostDatedCheque>(g => g.PostDatedCheques).WithRequired(s => s.CurrentVoucherType).WillCascadeOnDelete(false);
            modelBuilder.Entity<Bank>().HasMany<PostDatedCheque>(g => g.PostDatedCheques).WithRequired(s => s.CurrentBank).WillCascadeOnDelete(false);
            modelBuilder.Entity<PostDatedCheque>().HasMany<PostDatedChequeDetail>(g => g.PostDatedChequeDetails).WithRequired(s => s.CurrentPostDatedCheque).WillCascadeOnDelete(false);
            modelBuilder.Entity<AccountCategory>().HasMany<AccountGroup>(g => g.AccountGroups).WithRequired(s => s.CurrentAccountCategory).WillCascadeOnDelete(false);
            modelBuilder.Entity<AccountGroup>().HasMany<AccountHead>(g => g.AccountHeads).WithRequired(s => s.CurrentAccountGroup).WillCascadeOnDelete(false);
            modelBuilder.Entity<AccountJournal>().HasMany<AccountJournalDetail>(g => g.AccountJournalDetails).WithRequired(s => s.CurrentAccountJournal).WillCascadeOnDelete(false);
            modelBuilder.Entity<AccountHead>().HasMany<AccountJournalDetail>(g => g.AccountJournalDetails).WithRequired(s => s.CurrentAccountHead).WillCascadeOnDelete(false);
            modelBuilder.Entity<AnalysisGroup>().HasMany<AnalysisHead>(g => g.AnalysisHeads).WithRequired(s => s.CurrentAnalysisGroup).WillCascadeOnDelete(false);
            modelBuilder.Entity<AccountHead>().HasMany<AccountOpening>(g => g.AccountOpenings).WithRequired(s => s.CurrentAccountHead).WillCascadeOnDelete(false);
            modelBuilder.Entity<AccountJournal>().HasMany<AccountBank>(g => g.AccountBanks).WithRequired(s => s.CurrentAccountJournal).WillCascadeOnDelete(false);


            modelBuilder.Entity<Subject>().HasMany<Chapter>(g => g.Chapters).WithRequired(s => s.CurrentSubject).WillCascadeOnDelete(false);
            modelBuilder.Entity<Chapter>().HasMany<Topic>(g => g.Topics).WithRequired(s => s.CurrentChapter).WillCascadeOnDelete(false);           
            modelBuilder.Entity<City>().HasMany<Company>(g => g.Companys).WithRequired(s => s.CurrentCity).WillCascadeOnDelete(false);
            modelBuilder.Entity<Country>().HasMany<Company>(g => g.Companys).WithRequired(s => s.CurrentCountry).WillCascadeOnDelete(false);
            modelBuilder.Entity<Currency>().HasMany<Company>(g => g.Companys).WithRequired(s => s.CurrentCurrency).WillCascadeOnDelete(false);
            modelBuilder.Entity<Company>().HasMany<CompanyAcademicYear>(g => g.CompanyAcademicYears).WithRequired(s => s.CurrentCompany).WillCascadeOnDelete(false);
            modelBuilder.Entity<AcademicYear>().HasMany<CompanyAcademicYear>(g => g.CompanyAcademicYears).WithRequired(s => s.CurrentAcademicYear).WillCascadeOnDelete(false);
            modelBuilder.Entity<CompanyAcademicYear>().HasMany<School>(g => g.Schools).WithRequired(s => s.CurrentCompanyAcademicYear).WillCascadeOnDelete(false);
            modelBuilder.Entity<City>().HasMany<School>(g => g.Schools).WithRequired(s => s.CurrentCity).WillCascadeOnDelete(false);
            modelBuilder.Entity<Country>().HasMany<School>(g => g.Schools).WithRequired(s => s.CurrentCountry).WillCascadeOnDelete(false);
            modelBuilder.Entity<User>().HasMany<School>(g => g.Schools).WithRequired(s => s.CurrentUser).WillCascadeOnDelete(false);
            modelBuilder.Entity<School>().HasMany<Teacher>(g => g.Teachers).WithRequired(s => s.CurrentSchool).WillCascadeOnDelete(false);
            modelBuilder.Entity<City>().HasMany<Teacher>(g => g.Teachers).WithRequired(s => s.CurrentCity).WillCascadeOnDelete(false);
            modelBuilder.Entity<Country>().HasMany<Teacher>(g => g.Teachers).WithRequired(s => s.CurrentCountry).WillCascadeOnDelete(false);
            modelBuilder.Entity<User>().HasMany<Teacher>(g => g.Teachers).WithRequired(s => s.CurrentUser).WillCascadeOnDelete(false);
            modelBuilder.Entity<School>().HasMany<Parent>(g => g.Parents).WithRequired(s => s.CurrentSchool).WillCascadeOnDelete(false);
            modelBuilder.Entity<User>().HasMany<Parent>(g => g.Parents).WithRequired(s => s.CurrentUser).WillCascadeOnDelete(false);
            modelBuilder.Entity<City>().HasMany<Parent>(g => g.Parents).WithRequired(s => s.CurrentCity).WillCascadeOnDelete(false);
            modelBuilder.Entity<Country>().HasMany<Parent>(g => g.Parents).WithRequired(s => s.CurrentCountry).WillCascadeOnDelete(false);
            modelBuilder.Entity<School>().HasMany<Student>(g => g.Students).WithRequired(s => s.CurrentSchool).WillCascadeOnDelete(false);
            modelBuilder.Entity<User>().HasMany<Student>(g => g.Students).WithRequired(s => s.CurrentUser).WillCascadeOnDelete(false);
            modelBuilder.Entity<Parent>().HasMany<Student>(g => g.Students).WithRequired(s => s.CurrentParent).WillCascadeOnDelete(false);
            modelBuilder.Entity<Class>().HasMany<Student>(g => g.Students).WithRequired(s => s.CurrentClass).WillCascadeOnDelete(false);
            modelBuilder.Entity<Section>().HasMany<Student>(g => g.Students).WithRequired(s => s.CurrentSection).WillCascadeOnDelete(false);
            modelBuilder.Entity<School>().HasMany<Employee>(g => g.Employees).WithRequired(s => s.CurrentSchool).WillCascadeOnDelete(false);
            modelBuilder.Entity<City>().HasMany<Employee>(g => g.Employees).WithRequired(s => s.CurrentCity).WillCascadeOnDelete(false);
            modelBuilder.Entity<Country>().HasMany<Employee>(g => g.Employees).WithRequired(s => s.CurrentCountry).WillCascadeOnDelete(false);
            modelBuilder.Entity<User>().HasMany<Employee>(g => g.Employees).WithRequired(s => s.CurrentUser).WillCascadeOnDelete(false);
            modelBuilder.Entity<School>().HasMany<TimeTable>(g => g.TimeTables).WithRequired(s => s.CurrentSchool).WillCascadeOnDelete(false);
            modelBuilder.Entity<Class>().HasMany<TimeTable>(g => g.TimeTables).WithRequired(s => s.CurrentClass).WillCascadeOnDelete(false);
            modelBuilder.Entity<Section>().HasMany<TimeTable>(g => g.TimeTables).WithRequired(s => s.CurrentSection).WillCascadeOnDelete(false);
            modelBuilder.Entity<Period>().HasMany<TimeTable>(g => g.TimeTables).WithRequired(s => s.CurrentPeriod).WillCascadeOnDelete(false);
            modelBuilder.Entity<Teacher>().HasMany<TimeTable>(g => g.TimeTables).WithRequired(s => s.CurrentTeacher).WillCascadeOnDelete(false);
            modelBuilder.Entity<Subject>().HasMany<TimeTable>(g => g.TimeTables).WithRequired(s => s.CurrentSubject).WillCascadeOnDelete(false);
            modelBuilder.Entity<School>().HasMany<Exam>(g => g.Exams).WithRequired(s => s.CurrentSchool).WillCascadeOnDelete(false);
            modelBuilder.Entity<Subject>().HasMany<Exam>(g => g.Exams).WithRequired(s => s.CurrentSubject).WillCascadeOnDelete(false);
            modelBuilder.Entity<Exam>().HasMany<ExamPortion>(g => g.ExamPortions).WithRequired(s => s.CurrentExam).WillCascadeOnDelete(false);
            modelBuilder.Entity<Chapter>().HasMany<ExamPortion>(g => g.ExamPortions).WithRequired(s => s.CurrentChapter).WillCascadeOnDelete(false);
            modelBuilder.Entity<Topic>().HasMany<ExamPortion>(g => g.ExamPortions).WithRequired(s => s.CurrentTopic).WillCascadeOnDelete(false);
            modelBuilder.Entity<Class>().HasMany<Subject>(g => g.Subjects).WithRequired(s => s.CurrentClass).WillCascadeOnDelete(false);
            modelBuilder.Entity<User>().HasMany<StudentAttendance>(g => g.StudentAttendances).WithRequired(s => s.CurrentUser).WillCascadeOnDelete(false);
            modelBuilder.Entity<Student>().HasMany<StudentAttendance>(g => g.StudentAttendances).WithRequired(s => s.CurrentStudent).WillCascadeOnDelete(false);
            modelBuilder.Entity<AttendanceType>().HasMany<StudentAttendance>(g => g.StudentAttendances).WithRequired(s => s.CurrentAttendanceType).WillCascadeOnDelete(false);
            modelBuilder.Entity<User>().HasMany<TeacherAttendance>(g => g.TeacherAttendances).WithRequired(s => s.CurrentUser).WillCascadeOnDelete(false);
            modelBuilder.Entity<Teacher>().HasMany<TeacherAttendance>(g => g.TeacherAttendances).WithRequired(s => s.CurrentTeacher).WillCascadeOnDelete(false);
            modelBuilder.Entity<AttendanceType>().HasMany<TeacherAttendance>(g => g.TeacherAttendances).WithRequired(s => s.CurrentAttendanceType).WillCascadeOnDelete(false);
            modelBuilder.Entity<Student>().HasMany<FeeBook>(g => g.FeeBooks).WithRequired(s => s.CurrentStudent).WillCascadeOnDelete(false);
            modelBuilder.Entity<Teacher>().HasMany<SalaryBookTeacher>(g => g.SalaryBookTeachers).WithRequired(s => s.CurrentTeacher).WillCascadeOnDelete(false);
            modelBuilder.Entity<Employee>().HasMany<SalaryBookEmployee>(g => g.SalaryBookEmployees).WithRequired(s => s.CurrentEmployee).WillCascadeOnDelete(false);
            modelBuilder.Entity<User>().HasMany<Video>(g => g.Videos).WithRequired(s => s.CurrentUser).WillCascadeOnDelete(false);
            modelBuilder.Entity<NotificationType>().HasMany<Notification>(g => g.Notifications).WithRequired(s => s.CurrentNotificationType).WillCascadeOnDelete(false);
            modelBuilder.Entity<Notification>().HasMany<NotificationSchool>(g => g.NotificationSchools).WithRequired(s => s.CurrentNotification).WillCascadeOnDelete(false);
            modelBuilder.Entity<School>().HasMany<NotificationSchool>(g => g.NotificationSchools).WithRequired(s => s.CurrentSchool).WillCascadeOnDelete(false);
            modelBuilder.Entity<Notification>().HasMany<NotificationTeacher>(g => g.NotificationTeachers).WithRequired(s => s.CurrentNotification).WillCascadeOnDelete(false);
            modelBuilder.Entity<Teacher>().HasMany<NotificationTeacher>(g => g.NotificationTeachers).WithRequired(s => s.CurrentTeacher).WillCascadeOnDelete(false);
            modelBuilder.Entity<Notification>().HasMany<NotificationParent>(g => g.NotificationParents).WithRequired(s => s.CurrentNotification).WillCascadeOnDelete(false);
            modelBuilder.Entity<Parent>().HasMany<NotificationParent>(g => g.NotificationParents).WithRequired(s => s.CurrentParent).WillCascadeOnDelete(false);
            modelBuilder.Entity<Notification>().HasMany<NotificationStudent>(g => g.NotificationStudents).WithRequired(s => s.CurrentNotification).WillCascadeOnDelete(false);
            modelBuilder.Entity<Student>().HasMany<NotificationStudent>(g => g.NotificationStudents).WithRequired(s => s.CurrentStudent).WillCascadeOnDelete(false);
            modelBuilder.Entity<Notification>().HasMany<NotificationEmployee>(g => g.NotificationEmployees).WithRequired(s => s.CurrentNotification).WillCascadeOnDelete(false);
            modelBuilder.Entity<Employee>().HasMany<NotificationEmployee>(g => g.NotificationEmployees).WithRequired(s => s.CurrentEmployee).WillCascadeOnDelete(false);
            modelBuilder.Entity<Teacher>().HasMany<StudentAssignment>(g => g.StudentAssignments).WithRequired(s => s.CurrentTeacher).WillCascadeOnDelete(false);
            modelBuilder.Entity<Class>().HasMany<StudentAssignment>(g => g.StudentAssignments).WithRequired(s => s.CurrentClass).WillCascadeOnDelete(false);
            modelBuilder.Entity<Section>().HasMany<StudentAssignment>(g => g.StudentAssignments).WithRequired(s => s.CurrentSection).WillCascadeOnDelete(false);           
            modelBuilder.Entity<Subject>().HasMany<StudentAssignment>(g => g.StudentAssignments).WithRequired(s => s.CurrentSubject).WillCascadeOnDelete(false);
            modelBuilder.Entity<StudentAssignment>().HasMany<StudentAssignmentSubmission>(g => g.StudentAssignmentSubmissions).WithRequired(s => s.CurrentStudentAssignment).WillCascadeOnDelete(false);
            modelBuilder.Entity<Student>().HasMany<StudentAssignmentSubmission>(g => g.StudentAssignmentSubmissions).WithRequired(s => s.CurrentStudent).WillCascadeOnDelete(false);

        }
    }
}