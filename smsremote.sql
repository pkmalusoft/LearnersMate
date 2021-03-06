
ALTER TABLE [dbo].[smsVideos] DROP CONSTRAINT [FK_dbo.smsVideos_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsUserRoles] DROP CONSTRAINT [FK_dbo.smsUserRoles_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsUserRoles] DROP CONSTRAINT [FK_dbo.smsUserRoles_dbo.smsRoles_RoleID]
GO
ALTER TABLE [dbo].[smsUserPagePermissions] DROP CONSTRAINT [FK_dbo.smsUserPagePermissions_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsTopics] DROP CONSTRAINT [FK_dbo.smsTopics_dbo.smsChapters_ChapterID]
GO
ALTER TABLE [dbo].[smsTimeTables] DROP CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsTeachers_TeacherID]
GO
ALTER TABLE [dbo].[smsTimeTables] DROP CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsSubjects_SubjectID]
GO
ALTER TABLE [dbo].[smsTimeTables] DROP CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsSections_SectionID]
GO
ALTER TABLE [dbo].[smsTimeTables] DROP CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsTimeTables] DROP CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsPeriods_PeriodID]
GO
ALTER TABLE [dbo].[smsTimeTables] DROP CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsEmployees_Employee_EmployeeID]
GO
ALTER TABLE [dbo].[smsTimeTables] DROP CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsClasses_ClassID]
GO
ALTER TABLE [dbo].[smsTeachers] DROP CONSTRAINT [FK_dbo.smsTeachers_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsTeachers] DROP CONSTRAINT [FK_dbo.smsTeachers_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsTeachers] DROP CONSTRAINT [FK_dbo.smsTeachers_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsTeachers] DROP CONSTRAINT [FK_dbo.smsTeachers_dbo.smsCities_CityID]
GO
ALTER TABLE [dbo].[smsTeacherAttendances] DROP CONSTRAINT [FK_dbo.smsTeacherAttendances_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsTeacherAttendances] DROP CONSTRAINT [FK_dbo.smsTeacherAttendances_dbo.smsTeachers_TeacherID]
GO
ALTER TABLE [dbo].[smsTeacherAttendances] DROP CONSTRAINT [FK_dbo.smsTeacherAttendances_dbo.smsAttendanceTypes_AttendanceTypeID]
GO
ALTER TABLE [dbo].[smsTaskTaskLists] DROP CONSTRAINT [FK_dbo.smsTaskTaskLists_dbo.smsTaskTypes_TaskTypeID]
GO
ALTER TABLE [dbo].[smsTaskTaskLists] DROP CONSTRAINT [FK_dbo.smsTaskTaskLists_dbo.smsTaskStatuses_TaskStatusID]
GO
ALTER TABLE [dbo].[smsTaskTaskLists] DROP CONSTRAINT [FK_dbo.smsTaskTaskLists_dbo.smsTaskPriorities_TaskPriorityID]
GO
ALTER TABLE [dbo].[smsTaskEmployees] DROP CONSTRAINT [FK_dbo.smsTaskEmployees_dbo.smsTaskTaskLists_TaskListID]
GO
ALTER TABLE [dbo].[smsTaskEmployees] DROP CONSTRAINT [FK_dbo.smsTaskEmployees_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsSubMenu] DROP CONSTRAINT [FK_dbo.smsSubMenu_dbo.smsMainMenu_MainMenuID]
GO
ALTER TABLE [dbo].[smsSubjects] DROP CONSTRAINT [FK_dbo.smsSubjects_dbo.smsClasses_ClassID]
GO
ALTER TABLE [dbo].[smsStudents] DROP CONSTRAINT [FK_dbo.smsStudents_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsStudents] DROP CONSTRAINT [FK_dbo.smsStudents_dbo.smsSections_SectionID]
GO
ALTER TABLE [dbo].[smsStudents] DROP CONSTRAINT [FK_dbo.smsStudents_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsStudents] DROP CONSTRAINT [FK_dbo.smsStudents_dbo.smsParents_ParentID]
GO
ALTER TABLE [dbo].[smsStudents] DROP CONSTRAINT [FK_dbo.smsStudents_dbo.smsClasses_ClassID]
GO
ALTER TABLE [dbo].[smsStudentAttendances] DROP CONSTRAINT [FK_dbo.smsStudentAttendances_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsStudentAttendances] DROP CONSTRAINT [FK_dbo.smsStudentAttendances_dbo.smsStudents_StudentID]
GO
ALTER TABLE [dbo].[smsStudentAttendances] DROP CONSTRAINT [FK_dbo.smsStudentAttendances_dbo.smsAttendanceTypes_AttendanceTypeID]
GO
ALTER TABLE [dbo].[smsStudentAssignmentSubmissions] DROP CONSTRAINT [FK_dbo.smsSectionAssignmentSubmissions_dbo.smsStudents_StudentID]
GO
ALTER TABLE [dbo].[smsStudentAssignmentSubmissions] DROP CONSTRAINT [FK_dbo.smsSectionAssignmentSubmissions_dbo.smsSectionAssignments_StudentAssignmentID]
GO
ALTER TABLE [dbo].[smsStudentAssignments] DROP CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsTeachers_TeacherID]
GO
ALTER TABLE [dbo].[smsStudentAssignments] DROP CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsSubjects_SubjectID]
GO
ALTER TABLE [dbo].[smsStudentAssignments] DROP CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsSections_SectionID]
GO
ALTER TABLE [dbo].[smsStudentAssignments] DROP CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsClasses_ClassID]
GO
ALTER TABLE [dbo].[smsSchools] DROP CONSTRAINT [FK_dbo.smsSchools_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsSchools] DROP CONSTRAINT [FK_dbo.smsSchools_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsSchools] DROP CONSTRAINT [FK_dbo.smsSchools_dbo.smsCompanyAcademicYears_CompanyAcademicYearID]
GO
ALTER TABLE [dbo].[smsSchools] DROP CONSTRAINT [FK_dbo.smsSchools_dbo.smsCities_CityID]
GO
ALTER TABLE [dbo].[smsSalaryBookTeacher] DROP CONSTRAINT [FK_dbo.smsSalaryBookTeacher_dbo.smsTeachers_TeacherID]
GO
ALTER TABLE [dbo].[smsSalaryBookEmployee] DROP CONSTRAINT [FK_dbo.smsSalaryBookEmployee_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsPurchaseInvoices] DROP CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsSuppliers_SupplierID]
GO
ALTER TABLE [dbo].[smsPurchaseInvoices] DROP CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsPurchaseInvoices] DROP CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsDiscountTypes_DiscountTypeID]
GO
ALTER TABLE [dbo].[smsPurchaseInvoices] DROP CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsCurrencies_CurrencyID]
GO
ALTER TABLE [dbo].[smsPurchaseInvoiceDetails] DROP CONSTRAINT [FK_dbo.smsPurchaseInvoiceDetails_dbo.smsPurchaseInvoices_PurchaseInvoiceID]
GO
ALTER TABLE [dbo].[smsPostDatedCheques] DROP CONSTRAINT [FK_dbo.smsPostDatedCheques_dbo.smsVoucherTypes_VoucherTypeID]
GO
ALTER TABLE [dbo].[smsPostDatedCheques] DROP CONSTRAINT [FK_dbo.smsPostDatedCheques_dbo.smsBanks_BankID]
GO
ALTER TABLE [dbo].[smsPostDatedChequeDetails] DROP CONSTRAINT [FK_dbo.smsPostDatedChequeDetails_dbo.smsPostDatedCheques_PostDatedChequeID]
GO
ALTER TABLE [dbo].[smsParents] DROP CONSTRAINT [FK_dbo.smsParents_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsParents] DROP CONSTRAINT [FK_dbo.smsParents_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsParents] DROP CONSTRAINT [FK_dbo.smsParents_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsParents] DROP CONSTRAINT [FK_dbo.smsParents_dbo.smsCities_CityID]
GO
ALTER TABLE [dbo].[smsNotificationTeachers] DROP CONSTRAINT [FK_dbo.smsNotificationTeachers_dbo.smsTeachers_TeacherID]
GO
ALTER TABLE [dbo].[smsNotificationTeachers] DROP CONSTRAINT [FK_dbo.smsNotificationTeachers_dbo.smsNotifications_NotificationID]
GO
ALTER TABLE [dbo].[smsNotificationStudents] DROP CONSTRAINT [FK_dbo.smsNotificationStudents_dbo.smsStudents_StudentID]
GO
ALTER TABLE [dbo].[smsNotificationStudents] DROP CONSTRAINT [FK_dbo.smsNotificationStudents_dbo.smsNotifications_NotificationID]
GO
ALTER TABLE [dbo].[smsNotificationSchools] DROP CONSTRAINT [FK_dbo.smsNotificationSchools_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsNotificationSchools] DROP CONSTRAINT [FK_dbo.smsNotificationSchools_dbo.smsNotifications_NotificationID]
GO
ALTER TABLE [dbo].[smsNotifications] DROP CONSTRAINT [FK_dbo.smsNotifications_dbo.smsNotificationTypes_NotificationTypeID]
GO
ALTER TABLE [dbo].[smsNotificationParents] DROP CONSTRAINT [FK_dbo.smsNotificationParents_dbo.smsParents_ParentID]
GO
ALTER TABLE [dbo].[smsNotificationParents] DROP CONSTRAINT [FK_dbo.smsNotificationParents_dbo.smsNotifications_NotificationID]
GO
ALTER TABLE [dbo].[smsNotificationEmployees] DROP CONSTRAINT [FK_dbo.smsNotificationEmployees_dbo.smsNotifications_NotificationID]
GO
ALTER TABLE [dbo].[smsNotificationEmployees] DROP CONSTRAINT [FK_dbo.smsNotificationEmployees_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsJournalVouchers] DROP CONSTRAINT [FK_dbo.smsJournalVouchers_dbo.smsVoucherTypes_CurrentVoucherType_VoucherTypeID]
GO
ALTER TABLE [dbo].[smsJournalVouchers] DROP CONSTRAINT [FK_dbo.smsJournalVouchers_dbo.smsEmployees_CurrentEmployee_EmployeeID]
GO
ALTER TABLE [dbo].[smsJournalVoucherDetails] DROP CONSTRAINT [FK_dbo.smsJournalVoucherDetails_dbo.smsJournalVouchers_JournalVoucherID]
GO
ALTER TABLE [dbo].[smsJournalVoucherDetails] DROP CONSTRAINT [FK_dbo.smsJournalVoucherDetails_dbo.smsDebitCredits_DebitCreditID]
GO
ALTER TABLE [dbo].[smsJournalVoucherDetailAllocations] DROP CONSTRAINT [FK_dbo.smsJournalVoucherDetailAllocations_dbo.smsJournalVoucherDetails_JournalVoucherDetailID]
GO
ALTER TABLE [dbo].[smsJournalVoucherDetailAllocations] DROP CONSTRAINT [FK_dbo.smsJournalVoucherDetailAllocations_dbo.smsAllocationTypes_AllocationTypeID]
GO
ALTER TABLE [dbo].[smsFeeBook] DROP CONSTRAINT [FK_dbo.smsFeeBook_dbo.smsStudents_StudentID]
GO
ALTER TABLE [dbo].[smsExams] DROP CONSTRAINT [FK_dbo.smsExams_dbo.smsSubjects_SubjectID]
GO
ALTER TABLE [dbo].[smsExams] DROP CONSTRAINT [FK_dbo.smsExams_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsExamPortions] DROP CONSTRAINT [FK_dbo.smsExamPortions_dbo.smsTopics_TopicID]
GO
ALTER TABLE [dbo].[smsExamPortions] DROP CONSTRAINT [FK_dbo.smsExamPortions_dbo.smsExams_ExamID]
GO
ALTER TABLE [dbo].[smsExamPortions] DROP CONSTRAINT [FK_dbo.smsExamPortions_dbo.smsChapters_ChapterID]
GO
ALTER TABLE [dbo].[smsEmployees] DROP CONSTRAINT [FK_dbo.smsEmployees_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsEmployees] DROP CONSTRAINT [FK_dbo.smsEmployees_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsEmployees] DROP CONSTRAINT [FK_dbo.smsEmployees_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsEmployees] DROP CONSTRAINT [FK_dbo.smsEmployees_dbo.smsCities_CityID]
GO
ALTER TABLE [dbo].[smsEmployeeAttendances] DROP CONSTRAINT [FK_dbo.smsEmployeeAttendances_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsEmployeeAttendances] DROP CONSTRAINT [FK_dbo.smsEmployeeAttendances_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsEmployeeAttendances] DROP CONSTRAINT [FK_dbo.smsEmployeeAttendances_dbo.smsAttendanceTypes_AttendanceTypeID]
GO
ALTER TABLE [dbo].[smsCurrencies] DROP CONSTRAINT [FK_dbo.smsCurrencies_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsCompanyAcademicYears] DROP CONSTRAINT [FK_dbo.smsCompanyAcademicYears_dbo.smsCompanies_CompanyID]
GO
ALTER TABLE [dbo].[smsCompanyAcademicYears] DROP CONSTRAINT [FK_dbo.smsCompanyAcademicYears_dbo.smsAcademicYears_AcademicYearID]
GO
ALTER TABLE [dbo].[smsCompanies] DROP CONSTRAINT [FK_dbo.smsCompanies_dbo.smsCurrencies_CurrencyID]
GO
ALTER TABLE [dbo].[smsCompanies] DROP CONSTRAINT [FK_dbo.smsCompanies_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsCompanies] DROP CONSTRAINT [FK_dbo.smsCompanies_dbo.smsCities_CityID]
GO
ALTER TABLE [dbo].[smsChapters] DROP CONSTRAINT [FK_dbo.smsChapters_dbo.smsSubjects_SubjectID]
GO
ALTER TABLE [dbo].[smsCashVouchers] DROP CONSTRAINT [FK_dbo.smsCashVouchers_dbo.smsVoucherTypes_VoucherTypeID]
GO
ALTER TABLE [dbo].[smsCashVouchers] DROP CONSTRAINT [FK_dbo.smsCashVouchers_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsCashVoucherDetails] DROP CONSTRAINT [FK_dbo.smsCashVoucherDetails_dbo.smsCashVouchers_CashVoucherID]
GO
ALTER TABLE [dbo].[smsCashVoucherDetailAllocations] DROP CONSTRAINT [FK_dbo.smsCashVoucherDetailAllocations_dbo.smsCashVoucherDetails_CashVoucherDetailID]
GO
ALTER TABLE [dbo].[smsCashVoucherDetailAllocations] DROP CONSTRAINT [FK_dbo.smsCashVoucherDetailAllocations_dbo.smsAllocationTypes_AllocationTypeID]
GO
ALTER TABLE [dbo].[smsBankVouchers] DROP CONSTRAINT [FK_dbo.smsBankVouchers_dbo.smsVoucherTypes_VoucherTypeID]
GO
ALTER TABLE [dbo].[smsBankVouchers] DROP CONSTRAINT [FK_dbo.smsBankVouchers_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsBankVoucherDetails] DROP CONSTRAINT [FK_dbo.smsBankVoucherDetails_dbo.smsBankVouchers_BankVoucherID]
GO
ALTER TABLE [dbo].[smsBankVoucherDetailAllocations] DROP CONSTRAINT [FK_dbo.smsBankVoucherDetailAllocations_dbo.smsBankVoucherDetails_BankVoucherDetailID]
GO
ALTER TABLE [dbo].[smsBankVoucherDetailAllocations] DROP CONSTRAINT [FK_dbo.smsBankVoucherDetailAllocations_dbo.smsAllocationTypes_AllocationTypeID]
GO
ALTER TABLE [dbo].[smsAnalysisHeads] DROP CONSTRAINT [FK_dbo.smsAnalysisHeads_dbo.smsAnalysisGroups_AnalysisGroupID]
GO
ALTER TABLE [dbo].[smsAllocationTypes] DROP CONSTRAINT [FK_dbo.smsAllocationTypes_dbo.smsAllocationGroups_AllocationGroupID]
GO
ALTER TABLE [dbo].[smsAccountOpenings] DROP CONSTRAINT [FK_dbo.smsAccountOpenings_dbo.smsAccountHeads_AccountHeadID]
GO
ALTER TABLE [dbo].[smsAccountJournalDetails] DROP CONSTRAINT [FK_dbo.smsAccountJournalDetails_dbo.smsAccountJournals_AccountJournalID]
GO
ALTER TABLE [dbo].[smsAccountJournalDetails] DROP CONSTRAINT [FK_dbo.smsAccountJournalDetails_dbo.smsAccountHeads_AccountHeadID]
GO
ALTER TABLE [dbo].[smsAccountHeads] DROP CONSTRAINT [FK_dbo.smsAccountHeads_dbo.smsAccountGroups_AccountGroupID]
GO
ALTER TABLE [dbo].[smsAccountGroups] DROP CONSTRAINT [FK_dbo.smsAccountGroups_dbo.smsAccountCategories_AccountCategoryID]
GO
ALTER TABLE [dbo].[smsAccountBanks] DROP CONSTRAINT [FK_dbo.smsAccountBanks_dbo.smsBanks_BankID]
GO
ALTER TABLE [dbo].[smsAccountBanks] DROP CONSTRAINT [FK_dbo.smsAccountBanks_dbo.smsAccountJournals_AccountJournalID]
GO
ALTER TABLE [dbo].[smsStudentAssignments] DROP CONSTRAINT [DF__smsSectio__Detai__522F1F86]
GO
ALTER TABLE [dbo].[smsStudentAssignments] DROP CONSTRAINT [DF__smsSectio__Class__513AFB4D]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_UserID] ON [dbo].[smsUserRoles]
GO
/****** Object:  Index [IX_RoleID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_RoleID] ON [dbo].[smsUserRoles]
GO
/****** Object:  Index [IX_ChapterID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_ChapterID] ON [dbo].[smsTopics]
GO
/****** Object:  Index [IX_TeacherID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_TeacherID] ON [dbo].[smsTimeTables]
GO
/****** Object:  Index [IX_SubjectID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SubjectID] ON [dbo].[smsTimeTables]
GO
/****** Object:  Index [IX_SectionID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SectionID] ON [dbo].[smsTimeTables]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SchoolID] ON [dbo].[smsTimeTables]
GO
/****** Object:  Index [IX_PeriodID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_PeriodID] ON [dbo].[smsTimeTables]
GO
/****** Object:  Index [IX_Employee_EmployeeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_Employee_EmployeeID] ON [dbo].[smsTimeTables]
GO
/****** Object:  Index [IX_ClassID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_ClassID] ON [dbo].[smsTimeTables]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_UserID] ON [dbo].[smsTeachers]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SchoolID] ON [dbo].[smsTeachers]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CountryID] ON [dbo].[smsTeachers]
GO
/****** Object:  Index [IX_CityID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CityID] ON [dbo].[smsTeachers]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_UserID] ON [dbo].[smsTeacherAttendances]
GO
/****** Object:  Index [IX_TeacherID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_TeacherID] ON [dbo].[smsTeacherAttendances]
GO
/****** Object:  Index [IX_AttendanceTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AttendanceTypeID] ON [dbo].[smsTeacherAttendances]
GO
/****** Object:  Index [IX_TaskTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_TaskTypeID] ON [dbo].[smsTaskTaskLists]
GO
/****** Object:  Index [IX_TaskStatusID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_TaskStatusID] ON [dbo].[smsTaskTaskLists]
GO
/****** Object:  Index [IX_TaskPriorityID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_TaskPriorityID] ON [dbo].[smsTaskTaskLists]
GO
/****** Object:  Index [IX_TaskListID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_TaskListID] ON [dbo].[smsTaskEmployees]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_EmployeeID] ON [dbo].[smsTaskEmployees]
GO
/****** Object:  Index [IX_MainMenuID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_MainMenuID] ON [dbo].[smsSubMenu]
GO
/****** Object:  Index [IX_ClassID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_ClassID] ON [dbo].[smsSubjects]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_UserID] ON [dbo].[smsStudents]
GO
/****** Object:  Index [IX_SectionID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SectionID] ON [dbo].[smsStudents]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SchoolID] ON [dbo].[smsStudents]
GO
/****** Object:  Index [IX_ParentID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_ParentID] ON [dbo].[smsStudents]
GO
/****** Object:  Index [IX_ClassID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_ClassID] ON [dbo].[smsStudents]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_UserID] ON [dbo].[smsStudentAttendances]
GO
/****** Object:  Index [IX_StudentID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_StudentID] ON [dbo].[smsStudentAttendances]
GO
/****** Object:  Index [IX_AttendanceTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AttendanceTypeID] ON [dbo].[smsStudentAttendances]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_UserID] ON [dbo].[smsSchools]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CountryID] ON [dbo].[smsSchools]
GO
/****** Object:  Index [IX_CompanyAcademicYearID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CompanyAcademicYearID] ON [dbo].[smsSchools]
GO
/****** Object:  Index [IX_CityID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CityID] ON [dbo].[smsSchools]
GO
/****** Object:  Index [IX_TeacherID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_TeacherID] ON [dbo].[smsSalaryBookTeacher]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_EmployeeID] ON [dbo].[smsSalaryBookEmployee]
GO
/****** Object:  Index [IX_SupplierID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SupplierID] ON [dbo].[smsPurchaseInvoices]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_EmployeeID] ON [dbo].[smsPurchaseInvoices]
GO
/****** Object:  Index [IX_DiscountTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_DiscountTypeID] ON [dbo].[smsPurchaseInvoices]
GO
/****** Object:  Index [IX_CurrencyID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CurrencyID] ON [dbo].[smsPurchaseInvoices]
GO
/****** Object:  Index [IX_PurchaseInvoiceID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_PurchaseInvoiceID] ON [dbo].[smsPurchaseInvoiceDetails]
GO
/****** Object:  Index [IX_VoucherTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_VoucherTypeID] ON [dbo].[smsPostDatedCheques]
GO
/****** Object:  Index [IX_BankID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_BankID] ON [dbo].[smsPostDatedCheques]
GO
/****** Object:  Index [IX_PostDatedChequeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_PostDatedChequeID] ON [dbo].[smsPostDatedChequeDetails]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_UserID] ON [dbo].[smsParents]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SchoolID] ON [dbo].[smsParents]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CountryID] ON [dbo].[smsParents]
GO
/****** Object:  Index [IX_CityID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CityID] ON [dbo].[smsParents]
GO
/****** Object:  Index [IX_TeacherID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_TeacherID] ON [dbo].[smsNotificationTeachers]
GO
/****** Object:  Index [IX_NotificationID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_NotificationID] ON [dbo].[smsNotificationTeachers]
GO
/****** Object:  Index [IX_StudentID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_StudentID] ON [dbo].[smsNotificationStudents]
GO
/****** Object:  Index [IX_NotificationID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_NotificationID] ON [dbo].[smsNotificationStudents]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SchoolID] ON [dbo].[smsNotificationSchools]
GO
/****** Object:  Index [IX_NotificationID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_NotificationID] ON [dbo].[smsNotificationSchools]
GO
/****** Object:  Index [IX_NotificationTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_NotificationTypeID] ON [dbo].[smsNotifications]
GO
/****** Object:  Index [IX_ParentID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_ParentID] ON [dbo].[smsNotificationParents]
GO
/****** Object:  Index [IX_NotificationID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_NotificationID] ON [dbo].[smsNotificationParents]
GO
/****** Object:  Index [IX_NotificationID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_NotificationID] ON [dbo].[smsNotificationEmployees]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_EmployeeID] ON [dbo].[smsNotificationEmployees]
GO
/****** Object:  Index [IX_CurrentVoucherType_VoucherTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CurrentVoucherType_VoucherTypeID] ON [dbo].[smsJournalVouchers]
GO
/****** Object:  Index [IX_CurrentEmployee_EmployeeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CurrentEmployee_EmployeeID] ON [dbo].[smsJournalVouchers]
GO
/****** Object:  Index [IX_JournalVoucherID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_JournalVoucherID] ON [dbo].[smsJournalVoucherDetails]
GO
/****** Object:  Index [IX_DebitCreditID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_DebitCreditID] ON [dbo].[smsJournalVoucherDetails]
GO
/****** Object:  Index [IX_JournalVoucherDetailID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_JournalVoucherDetailID] ON [dbo].[smsJournalVoucherDetailAllocations]
GO
/****** Object:  Index [IX_AllocationTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AllocationTypeID] ON [dbo].[smsJournalVoucherDetailAllocations]
GO
/****** Object:  Index [IX_StudentID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_StudentID] ON [dbo].[smsFeeBook]
GO
/****** Object:  Index [IX_SubjectID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SubjectID] ON [dbo].[smsExams]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SchoolID] ON [dbo].[smsExams]
GO
/****** Object:  Index [IX_TopicID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_TopicID] ON [dbo].[smsExamPortions]
GO
/****** Object:  Index [IX_ExamID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_ExamID] ON [dbo].[smsExamPortions]
GO
/****** Object:  Index [IX_ChapterID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_ChapterID] ON [dbo].[smsExamPortions]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_UserID] ON [dbo].[smsEmployees]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SchoolID] ON [dbo].[smsEmployees]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CountryID] ON [dbo].[smsEmployees]
GO
/****** Object:  Index [IX_CityID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CityID] ON [dbo].[smsEmployees]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_UserID] ON [dbo].[smsEmployeeAttendances]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_EmployeeID] ON [dbo].[smsEmployeeAttendances]
GO
/****** Object:  Index [IX_AttendanceTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AttendanceTypeID] ON [dbo].[smsEmployeeAttendances]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CountryID] ON [dbo].[smsCurrencies]
GO
/****** Object:  Index [IX_CompanyID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CompanyID] ON [dbo].[smsCompanyAcademicYears]
GO
/****** Object:  Index [IX_AcademicYearID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AcademicYearID] ON [dbo].[smsCompanyAcademicYears]
GO
/****** Object:  Index [IX_CurrencyID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CurrencyID] ON [dbo].[smsCompanies]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CountryID] ON [dbo].[smsCompanies]
GO
/****** Object:  Index [IX_CityID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CityID] ON [dbo].[smsCompanies]
GO
/****** Object:  Index [IX_SubjectID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_SubjectID] ON [dbo].[smsChapters]
GO
/****** Object:  Index [IX_VoucherTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_VoucherTypeID] ON [dbo].[smsCashVouchers]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_EmployeeID] ON [dbo].[smsCashVouchers]
GO
/****** Object:  Index [IX_CashVoucherID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CashVoucherID] ON [dbo].[smsCashVoucherDetails]
GO
/****** Object:  Index [IX_CashVoucherDetailID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_CashVoucherDetailID] ON [dbo].[smsCashVoucherDetailAllocations]
GO
/****** Object:  Index [IX_AllocationTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AllocationTypeID] ON [dbo].[smsCashVoucherDetailAllocations]
GO
/****** Object:  Index [IX_VoucherTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_VoucherTypeID] ON [dbo].[smsBankVouchers]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_EmployeeID] ON [dbo].[smsBankVouchers]
GO
/****** Object:  Index [IX_BankVoucherID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_BankVoucherID] ON [dbo].[smsBankVoucherDetails]
GO
/****** Object:  Index [IX_BankVoucherDetailID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_BankVoucherDetailID] ON [dbo].[smsBankVoucherDetailAllocations]
GO
/****** Object:  Index [IX_AllocationTypeID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AllocationTypeID] ON [dbo].[smsBankVoucherDetailAllocations]
GO
/****** Object:  Index [IX_AnalysisGroupID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AnalysisGroupID] ON [dbo].[smsAnalysisHeads]
GO
/****** Object:  Index [IX_AllocationGroupID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AllocationGroupID] ON [dbo].[smsAllocationTypes]
GO
/****** Object:  Index [IX_AccountHeadID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AccountHeadID] ON [dbo].[smsAccountOpenings]
GO
/****** Object:  Index [IX_AccountJournalID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AccountJournalID] ON [dbo].[smsAccountJournalDetails]
GO
/****** Object:  Index [IX_AccountHeadID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AccountHeadID] ON [dbo].[smsAccountJournalDetails]
GO
/****** Object:  Index [IX_AccountGroupID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AccountGroupID] ON [dbo].[smsAccountHeads]
GO
/****** Object:  Index [IX_AccountCategoryID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AccountCategoryID] ON [dbo].[smsAccountGroups]
GO
/****** Object:  Index [IX_BankID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_BankID] ON [dbo].[smsAccountBanks]
GO
/****** Object:  Index [IX_AccountJournalID]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP INDEX [IX_AccountJournalID] ON [dbo].[smsAccountBanks]
GO
/****** Object:  Table [dbo].[smsVoucherTypes]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsVoucherTypes]
GO
/****** Object:  Table [dbo].[smsVideos]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsVideos]
GO
/****** Object:  Table [dbo].[smsUsers]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsUsers]
GO
/****** Object:  Table [dbo].[smsUserRoles]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsUserRoles]
GO
/****** Object:  Table [dbo].[smsUserPageViews]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsUserPageViews]
GO
/****** Object:  Table [dbo].[smsUserPagePermissions]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsUserPagePermissions]
GO
/****** Object:  Table [dbo].[smsTrialBalances]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTrialBalances]
GO
/****** Object:  Table [dbo].[smsTransactionTypes]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTransactionTypes]
GO
/****** Object:  Table [dbo].[smsTopics]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTopics]
GO
/****** Object:  Table [dbo].[smsTokensManager]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTokensManager]
GO
/****** Object:  Table [dbo].[smsTokens]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTokens]
GO
/****** Object:  Table [dbo].[smsTimeTables]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTimeTables]
GO
/****** Object:  Table [dbo].[smsTeachers]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTeachers]
GO
/****** Object:  Table [dbo].[smsTeacherAttendances]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTeacherAttendances]
GO
/****** Object:  Table [dbo].[smsTaskTypes]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTaskTypes]
GO
/****** Object:  Table [dbo].[smsTaskTaskLists]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTaskTaskLists]
GO
/****** Object:  Table [dbo].[smsTaskStatuses]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTaskStatuses]
GO
/****** Object:  Table [dbo].[smsTaskPriorities]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTaskPriorities]
GO
/****** Object:  Table [dbo].[smsTaskEmployees]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsTaskEmployees]
GO
/****** Object:  Table [dbo].[smsSuppliers]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsSuppliers]
GO
/****** Object:  Table [dbo].[smsSubMenu]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsSubMenu]
GO
/****** Object:  Table [dbo].[smsSubjects]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsSubjects]
GO
/****** Object:  Table [dbo].[smsStudents]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsStudents]
GO
/****** Object:  Table [dbo].[smsStudentAttendances]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsStudentAttendances]
GO
/****** Object:  Table [dbo].[smsStudentAssignmentSubmissions]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsStudentAssignmentSubmissions]
GO
/****** Object:  Table [dbo].[smsStudentAssignments]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsStudentAssignments]
GO
/****** Object:  Table [dbo].[smsSections]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsSections]
GO
/****** Object:  Table [dbo].[smsSchools]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsSchools]
GO
/****** Object:  Table [dbo].[smsSalaryBookTeacher]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsSalaryBookTeacher]
GO
/****** Object:  Table [dbo].[smsSalaryBookEmployee]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsSalaryBookEmployee]
GO
/****** Object:  Table [dbo].[smsRoles]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsRoles]
GO
/****** Object:  Table [dbo].[smsRevenueTypes]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsRevenueTypes]
GO
/****** Object:  Table [dbo].[smsPurchaseInvoices]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsPurchaseInvoices]
GO
/****** Object:  Table [dbo].[smsPurchaseInvoiceDetails]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsPurchaseInvoiceDetails]
GO
/****** Object:  Table [dbo].[smsPostDatedCheques]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsPostDatedCheques]
GO
/****** Object:  Table [dbo].[smsPostDatedChequeDetails]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsPostDatedChequeDetails]
GO
/****** Object:  Table [dbo].[smsPeriods]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsPeriods]
GO
/****** Object:  Table [dbo].[smsParents]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsParents]
GO
/****** Object:  Table [dbo].[smsNotificationTypes]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsNotificationTypes]
GO
/****** Object:  Table [dbo].[smsNotificationTeachers]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsNotificationTeachers]
GO
/****** Object:  Table [dbo].[smsNotificationStudents]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsNotificationStudents]
GO
/****** Object:  Table [dbo].[smsNotificationSchools]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsNotificationSchools]
GO
/****** Object:  Table [dbo].[smsNotifications]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsNotifications]
GO
/****** Object:  Table [dbo].[smsNotificationParents]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsNotificationParents]
GO
/****** Object:  Table [dbo].[smsNotificationEmployees]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsNotificationEmployees]
GO
/****** Object:  Table [dbo].[smsMainMenu]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsMainMenu]
GO
/****** Object:  Table [dbo].[smsLedgerBooks]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsLedgerBooks]
GO
/****** Object:  Table [dbo].[smsJournalVouchers]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsJournalVouchers]
GO
/****** Object:  Table [dbo].[smsJournalVoucherDetails]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsJournalVoucherDetails]
GO
/****** Object:  Table [dbo].[smsJournalVoucherDetailAllocations]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsJournalVoucherDetailAllocations]
GO
/****** Object:  Table [dbo].[smsGenders]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsGenders]
GO
/****** Object:  Table [dbo].[smsFeeBook]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsFeeBook]
GO
/****** Object:  Table [dbo].[smsExceptionLoggers]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsExceptionLoggers]
GO
/****** Object:  Table [dbo].[smsExams]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsExams]
GO
/****** Object:  Table [dbo].[smsExamPortions]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsExamPortions]
GO
/****** Object:  Table [dbo].[smsEmployees]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsEmployees]
GO
/****** Object:  Table [dbo].[smsEmployeeAttendances]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsEmployeeAttendances]
GO
/****** Object:  Table [dbo].[smsDiscountTypes]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsDiscountTypes]
GO
/****** Object:  Table [dbo].[smsDebitCredits]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsDebitCredits]
GO
/****** Object:  Table [dbo].[smsDayBooks]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsDayBooks]
GO
/****** Object:  Table [dbo].[smsCurrencies]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsCurrencies]
GO
/****** Object:  Table [dbo].[smsCountries]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsCountries]
GO
/****** Object:  Table [dbo].[smsCompanyAcademicYears]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsCompanyAcademicYears]
GO
/****** Object:  Table [dbo].[smsCompanies]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsCompanies]
GO
/****** Object:  Table [dbo].[smsClientKey]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsClientKey]
GO
/****** Object:  Table [dbo].[smsClasses]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsClasses]
GO
/****** Object:  Table [dbo].[smsCities]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsCities]
GO
/****** Object:  Table [dbo].[smsChequeStatuses]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsChequeStatuses]
GO
/****** Object:  Table [dbo].[smsChapters]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsChapters]
GO
/****** Object:  Table [dbo].[smsCashVouchers]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsCashVouchers]
GO
/****** Object:  Table [dbo].[smsCashVoucherDetails]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsCashVoucherDetails]
GO
/****** Object:  Table [dbo].[smsCashVoucherDetailAllocations]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsCashVoucherDetailAllocations]
GO
/****** Object:  Table [dbo].[smsCashBooks]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsCashBooks]
GO
/****** Object:  Table [dbo].[smsCalendars]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsCalendars]
GO
/****** Object:  Table [dbo].[smsBankVouchers]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsBankVouchers]
GO
/****** Object:  Table [dbo].[smsBankVoucherDetails]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsBankVoucherDetails]
GO
/****** Object:  Table [dbo].[smsBankVoucherDetailAllocations]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsBankVoucherDetailAllocations]
GO
/****** Object:  Table [dbo].[smsBanks]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsBanks]
GO
/****** Object:  Table [dbo].[smsBankDepositStatuses]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsBankDepositStatuses]
GO
/****** Object:  Table [dbo].[smsAttendanceTypes]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAttendanceTypes]
GO
/****** Object:  Table [dbo].[smsAnalysisHeads]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAnalysisHeads]
GO
/****** Object:  Table [dbo].[smsAnalysisGroups]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAnalysisGroups]
GO
/****** Object:  Table [dbo].[smsAllocationTypes]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAllocationTypes]
GO
/****** Object:  Table [dbo].[smsAllocationGroups]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAllocationGroups]
GO
/****** Object:  Table [dbo].[smsAccountOpenings]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAccountOpenings]
GO
/****** Object:  Table [dbo].[smsAccountJournals]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAccountJournals]
GO
/****** Object:  Table [dbo].[smsAccountJournalDetails]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAccountJournalDetails]
GO
/****** Object:  Table [dbo].[smsAccountHeads]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAccountHeads]
GO
/****** Object:  Table [dbo].[smsAccountHeadAssign]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAccountHeadAssign]
GO
/****** Object:  Table [dbo].[smsAccountGroups]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAccountGroups]
GO
/****** Object:  Table [dbo].[smsAccountCategories]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAccountCategories]
GO
/****** Object:  Table [dbo].[smsAccountBanks]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAccountBanks]
GO
/****** Object:  Table [dbo].[smsAcademicYears]    Script Date: 11/24/2018 7:28:06 AM ******/
DROP TABLE [dbo].[smsAcademicYears]
GO
/****** Object:  Table [dbo].[smsAcademicYears]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAcademicYears](
	[AcademicYearID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[YearFrom] [datetime] NOT NULL,
	[YearTo] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.smsAcademicYears] PRIMARY KEY CLUSTERED 
(
	[AcademicYearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAccountBanks]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAccountBanks](
	[AccountBankID] [int] IDENTITY(1,1) NOT NULL,
	[BankID] [int] NOT NULL,
	[AccountJournalID] [int] NOT NULL,
	[ChequeNo] [nvarchar](100) NULL,
	[ChequeDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsAccountBanks] PRIMARY KEY CLUSTERED 
(
	[AccountBankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAccountCategories]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAccountCategories](
	[AccountCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsAccountCategories] PRIMARY KEY CLUSTERED 
(
	[AccountCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAccountGroups]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAccountGroups](
	[AccountGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AccountCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsAccountGroups] PRIMARY KEY CLUSTERED 
(
	[AccountGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAccountHeadAssign]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAccountHeadAssign](
	[HeadAssignID] [int] IDENTITY(1,1) NOT NULL,
	[RevenueType] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[AccountHeadID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsAccountHeadAssign] PRIMARY KEY CLUSTERED 
(
	[HeadAssignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAccountHeads]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAccountHeads](
	[AccountHeadID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AccountGroupID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsAccountHeads] PRIMARY KEY CLUSTERED 
(
	[AccountHeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAccountJournalDetails]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAccountJournalDetails](
	[AccountJournalDetailID] [int] IDENTITY(1,1) NOT NULL,
	[AccountJournalID] [int] NOT NULL,
	[AccountHeadID] [int] NOT NULL,
	[AnalysisHeadID] [int] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](4000) NULL,
 CONSTRAINT [PK_dbo.smsAccountJournalDetails] PRIMARY KEY CLUSTERED 
(
	[AccountJournalDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAccountJournals]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAccountJournals](
	[AccountJournalID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherNo] [nvarchar](100) NOT NULL,
	[VoucherType] [nvarchar](100) NULL,
	[TransactionDate] [datetime] NULL,
	[BranchID] [int] NOT NULL,
	[FinancialYearID] [int] NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Remarks] [nvarchar](4000) NULL,
 CONSTRAINT [PK_dbo.smsAccountJournals] PRIMARY KEY CLUSTERED 
(
	[AccountJournalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAccountOpenings]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAccountOpenings](
	[AccountOpeningID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NOT NULL,
	[FinancialYearID] [int] NOT NULL,
	[AccountHeadID] [int] NOT NULL,
	[OpeningDate] [datetime] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](4000) NULL,
 CONSTRAINT [PK_dbo.smsAccountOpenings] PRIMARY KEY CLUSTERED 
(
	[AccountOpeningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAllocationGroups]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAllocationGroups](
	[AllocationGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsAllocationGroups] PRIMARY KEY CLUSTERED 
(
	[AllocationGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAllocationTypes]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAllocationTypes](
	[AllocationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AllocationGroupID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsAllocationTypes] PRIMARY KEY CLUSTERED 
(
	[AllocationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAnalysisGroups]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAnalysisGroups](
	[AnalysisGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsAnalysisGroups] PRIMARY KEY CLUSTERED 
(
	[AnalysisGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAnalysisHeads]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAnalysisHeads](
	[AnalysisHeadID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](100) NOT NULL,
	[AnalysisGroupID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsAnalysisHeads] PRIMARY KEY CLUSTERED 
(
	[AnalysisHeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsAttendanceTypes]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsAttendanceTypes](
	[AttendanceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsAttendanceTypes] PRIMARY KEY CLUSTERED 
(
	[AttendanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsBankDepositStatuses]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsBankDepositStatuses](
	[BankDepositStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsBankDepositStatuses] PRIMARY KEY CLUSTERED 
(
	[BankDepositStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsBanks]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsBanks](
	[BankID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsBanks] PRIMARY KEY CLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsBankVoucherDetailAllocations]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsBankVoucherDetailAllocations](
	[BankVoucherDetailAllocationID] [int] IDENTITY(1,1) NOT NULL,
	[BankVoucherDetailID] [int] NOT NULL,
	[AllocationTypeID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.smsBankVoucherDetailAllocations] PRIMARY KEY CLUSTERED 
(
	[BankVoucherDetailAllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsBankVoucherDetails]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsBankVoucherDetails](
	[BankVoucherDetailID] [int] IDENTITY(1,1) NOT NULL,
	[BankVoucherID] [int] NOT NULL,
	[AccountHeadID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](1000) NULL,
 CONSTRAINT [PK_dbo.smsBankVoucherDetails] PRIMARY KEY CLUSTERED 
(
	[BankVoucherDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsBankVouchers]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsBankVouchers](
	[BankVoucherID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherNo] [nvarchar](100) NOT NULL,
	[VoucherTypeID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[AccountHeadID] [int] NOT NULL,
	[VoucherDate] [datetime] NULL,
	[ReferenceNo] [nvarchar](100) NULL,
	[ReferenceDate] [datetime] NULL,
	[Narration] [nvarchar](2000) NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsBankVouchers] PRIMARY KEY CLUSTERED 
(
	[BankVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsCalendars]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsCalendars](
	[CalendarID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[DayName] [nvarchar](10) NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](250) NULL,
	[IsHoliday] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsCalendars] PRIMARY KEY CLUSTERED 
(
	[CalendarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsCashBooks]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsCashBooks](
	[CashBookID] [int] IDENTITY(1,1) NOT NULL,
	[Col1] [nvarchar](100) NULL,
	[Col2] [nvarchar](1000) NULL,
	[Col3] [nvarchar](100) NULL,
	[Col4] [nvarchar](100) NULL,
	[Col5] [nvarchar](100) NULL,
	[Address] [nvarchar](1000) NULL,
	[FromToDate] [nvarchar](100) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsCashBooks] PRIMARY KEY CLUSTERED 
(
	[CashBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsCashVoucherDetailAllocations]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsCashVoucherDetailAllocations](
	[CashVoucherDetailAllocationID] [int] IDENTITY(1,1) NOT NULL,
	[CashVoucherDetailID] [int] NOT NULL,
	[AllocationTypeID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.smsCashVoucherDetailAllocations] PRIMARY KEY CLUSTERED 
(
	[CashVoucherDetailAllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsCashVoucherDetails]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsCashVoucherDetails](
	[CashVoucherDetailID] [int] IDENTITY(1,1) NOT NULL,
	[CashVoucherID] [int] NOT NULL,
	[AccountHeadID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](1000) NULL,
 CONSTRAINT [PK_dbo.smsCashVoucherDetails] PRIMARY KEY CLUSTERED 
(
	[CashVoucherDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsCashVouchers]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsCashVouchers](
	[CashVoucherID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherNo] [nvarchar](100) NOT NULL,
	[VoucherTypeID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[AccountHeadID] [int] NOT NULL,
	[VoucherDate] [datetime] NULL,
	[ReferenceNo] [nvarchar](100) NULL,
	[ReferenceDate] [datetime] NULL,
	[Narration] [nvarchar](2000) NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsCashVouchers] PRIMARY KEY CLUSTERED 
(
	[CashVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsChapters]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsChapters](
	[ChapterID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SubjectID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsChapters] PRIMARY KEY CLUSTERED 
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsChequeStatuses]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsChequeStatuses](
	[ChequeStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsChequeStatuses] PRIMARY KEY CLUSTERED 
(
	[ChequeStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsCities]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsCities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CityCode] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsCities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsClasses]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsClasses](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsClasses] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsClientKey]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsClientKey](
	[ClientKeyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[ClientID] [nvarchar](max) NULL,
	[ClientSecret] [nvarchar](max) NULL,
	[CreateOn] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsClientKey] PRIMARY KEY CLUSTERED 
(
	[ClientKeyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsCompanies]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsCompanies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[HouseNo] [nvarchar](500) NULL,
	[BuildingName] [nvarchar](500) NULL,
	[Street] [nvarchar](500) NULL,
	[Area] [nvarchar](500) NULL,
	[Location] [nvarchar](500) NULL,
	[CityID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[PinCode] [nvarchar](50) NULL,
	[Landline] [nvarchar](50) NULL,
	[Mobile] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Website] [nvarchar](500) NULL,
	[RegNo] [nvarchar](500) NULL,
	[CurrencyID] [int] NOT NULL,
	[DefaultLanguage] [bit] NOT NULL,
	[Logo] [nvarchar](4000) NULL,
 CONSTRAINT [PK_dbo.smsCompanies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsCompanyAcademicYears]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsCompanyAcademicYears](
	[CompanyAcademicYearID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[AcademicYearID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsCompanyAcademicYears] PRIMARY KEY CLUSTERED 
(
	[CompanyAcademicYearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsCountries]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsCountries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountryCode] [nvarchar](100) NOT NULL,
	[Nationality] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsCountries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsCurrencies]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsCurrencies](
	[CurrencyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountryID] [int] NOT NULL,
	[Symbol] [nvarchar](50) NOT NULL,
	[NoOfDecimals] [smallint] NOT NULL,
	[MonetaryUnit] [nvarchar](100) NULL,
	[StatusBaseCurrency] [bit] NOT NULL,
	[ExchangeRate] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.smsCurrencies] PRIMARY KEY CLUSTERED 
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsDayBooks]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsDayBooks](
	[DayBookID] [int] IDENTITY(1,1) NOT NULL,
	[Col1] [nvarchar](100) NULL,
	[Col2] [nvarchar](4000) NULL,
	[Col3] [nvarchar](100) NULL,
	[Col4] [nvarchar](100) NULL,
	[Col5] [nvarchar](100) NULL,
	[Col6] [nvarchar](100) NULL,
	[Col7] [nvarchar](100) NULL,
	[Col8] [nvarchar](100) NULL,
	[Col9] [nvarchar](4000) NULL,
 CONSTRAINT [PK_dbo.smsDayBooks] PRIMARY KEY CLUSTERED 
(
	[DayBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsDebitCredits]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsDebitCredits](
	[DebitCreditID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsDebitCredits] PRIMARY KEY CLUSTERED 
(
	[DebitCreditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsDiscountTypes]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsDiscountTypes](
	[DiscountTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsDiscountTypes] PRIMARY KEY CLUSTERED 
(
	[DiscountTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsEmployeeAttendances]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsEmployeeAttendances](
	[EmployeeAttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceTypeID] [int] NOT NULL,
	[AttendanceDate] [datetime] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsEmployeeAttendances] PRIMARY KEY CLUSTERED 
(
	[EmployeeAttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsEmployees]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsEmployees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IdCard] [nvarchar](100) NULL,
	[HouseNo] [nvarchar](500) NULL,
	[BuildingName] [nvarchar](500) NULL,
	[Street] [nvarchar](500) NULL,
	[Area] [nvarchar](500) NULL,
	[Location] [nvarchar](500) NULL,
	[CityID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[PinCode] [nvarchar](50) NULL,
	[Landline] [nvarchar](50) NULL,
	[Mobile] [nvarchar](100) NULL,
	[Photo] [nvarchar](4000) NULL,
	[SchoolID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[LeavesToAvail] [int] NOT NULL,
	[Salary] [decimal](18, 2) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsEmployees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsExamPortions]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsExamPortions](
	[ExamPortionID] [int] IDENTITY(1,1) NOT NULL,
	[ExamID] [int] NOT NULL,
	[ChapterID] [int] NOT NULL,
	[TopicID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsExamPortions] PRIMARY KEY CLUSTERED 
(
	[ExamPortionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsExams]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsExams](
	[ExamID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Remarks] [nvarchar](1000) NULL,
 CONSTRAINT [PK_dbo.smsExams] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsExceptionLoggers]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsExceptionLoggers](
	[ExceptionLoggerID] [int] IDENTITY(1,1) NOT NULL,
	[ExceptionMessage] [nvarchar](max) NULL,
	[ControllerName] [nvarchar](max) NULL,
	[ExceptionStackTrace] [nvarchar](max) NULL,
	[LogTime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.smsExceptionLoggers] PRIMARY KEY CLUSTERED 
(
	[ExceptionLoggerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsFeeBook]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsFeeBook](
	[FeeBookID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Dop] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsFeeBook] PRIMARY KEY CLUSTERED 
(
	[FeeBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsGenders]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsGenders](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsGenders] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsJournalVoucherDetailAllocations]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsJournalVoucherDetailAllocations](
	[JournalVoucherDetailAllocationID] [int] IDENTITY(1,1) NOT NULL,
	[JournalVoucherDetailID] [int] NOT NULL,
	[AllocationTypeID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.smsJournalVoucherDetailAllocations] PRIMARY KEY CLUSTERED 
(
	[JournalVoucherDetailAllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsJournalVoucherDetails]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsJournalVoucherDetails](
	[JournalVoucherDetailID] [int] IDENTITY(1,1) NOT NULL,
	[JournalVoucherID] [int] NOT NULL,
	[AccountHeadID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DebitCreditID] [int] NOT NULL,
	[Remarks] [nvarchar](1000) NULL,
 CONSTRAINT [PK_dbo.smsJournalVoucherDetails] PRIMARY KEY CLUSTERED 
(
	[JournalVoucherDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsJournalVouchers]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsJournalVouchers](
	[JournalVoucherID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherNo] [nvarchar](100) NOT NULL,
	[VoucherDate] [datetime] NULL,
	[Narration] [nvarchar](2000) NULL,
	[DebitTotalAmount] [decimal](18, 2) NOT NULL,
	[CreditTotalAmount] [decimal](18, 2) NOT NULL,
	[DiffTotalAmount] [decimal](18, 2) NOT NULL,
	[Flag] [bit] NOT NULL,
	[CurrentEmployee_EmployeeID] [int] NULL,
	[CurrentVoucherType_VoucherTypeID] [int] NULL,
 CONSTRAINT [PK_dbo.smsJournalVouchers] PRIMARY KEY CLUSTERED 
(
	[JournalVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsLedgerBooks]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsLedgerBooks](
	[LedgerBookID] [int] IDENTITY(1,1) NOT NULL,
	[Col1] [nvarchar](100) NULL,
	[Col2] [nvarchar](1000) NULL,
	[Col3] [nvarchar](100) NULL,
	[Col4] [nvarchar](100) NULL,
	[Col5] [nvarchar](100) NULL,
	[Col6] [nvarchar](100) NULL,
	[Address] [nvarchar](1000) NULL,
	[FromToDate] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsLedgerBooks] PRIMARY KEY CLUSTERED 
(
	[LedgerBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsMainMenu]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsMainMenu](
	[MainMenuID] [int] IDENTITY(1,1) NOT NULL,
	[MainMenuName] [nvarchar](100) NOT NULL,
	[MainMenuName2] [nvarchar](100) NULL,
	[MainMenuOrder] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsMainMenu] PRIMARY KEY CLUSTERED 
(
	[MainMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsNotificationEmployees]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsNotificationEmployees](
	[NotificationEmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsNotificationEmployees] PRIMARY KEY CLUSTERED 
(
	[NotificationEmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsNotificationParents]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsNotificationParents](
	[NotificationParentID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationID] [int] NOT NULL,
	[ParentID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsNotificationParents] PRIMARY KEY CLUSTERED 
(
	[NotificationParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsNotifications]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsNotifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationTypeID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Detail] [nvarchar](4000) NOT NULL,
	[NotifiedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsNotifications] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsNotificationSchools]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsNotificationSchools](
	[NotificationSchoolID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationID] [int] NOT NULL,
	[SchoolID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsNotificationSchools] PRIMARY KEY CLUSTERED 
(
	[NotificationSchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsNotificationStudents]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsNotificationStudents](
	[NotificationStudentID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsNotificationStudents] PRIMARY KEY CLUSTERED 
(
	[NotificationStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsNotificationTeachers]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsNotificationTeachers](
	[NotificationTeacherID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsNotificationTeachers] PRIMARY KEY CLUSTERED 
(
	[NotificationTeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsNotificationTypes]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsNotificationTypes](
	[NotificationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsNotificationTypes] PRIMARY KEY CLUSTERED 
(
	[NotificationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsParents]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsParents](
	[ParentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[HouseNo] [nvarchar](500) NULL,
	[BuildingName] [nvarchar](500) NULL,
	[Street] [nvarchar](500) NULL,
	[Area] [nvarchar](500) NULL,
	[Location] [nvarchar](500) NULL,
	[CityID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[PinCode] [nvarchar](50) NULL,
	[Landline] [nvarchar](50) NULL,
	[Mobile] [nvarchar](100) NULL,
	[Photo] [nvarchar](4000) NULL,
	[SchoolID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsParents] PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsPeriods]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsPeriods](
	[PeriodID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Time] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsPeriods] PRIMARY KEY CLUSTERED 
(
	[PeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsPostDatedChequeDetails]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsPostDatedChequeDetails](
	[PostDatedChequeDetailID] [int] IDENTITY(1,1) NOT NULL,
	[PostDatedChequeID] [int] NOT NULL,
	[ReceivedFromID] [int] NOT NULL,
	[AccountHeadID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](1000) NULL,
 CONSTRAINT [PK_dbo.smsPostDatedChequeDetails] PRIMARY KEY CLUSTERED 
(
	[PostDatedChequeDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsPostDatedCheques]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsPostDatedCheques](
	[PostDatedChequeID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherNo] [nvarchar](100) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[VoucherTypeID] [int] NOT NULL,
	[BankID] [int] NOT NULL,
	[PayersBank] [nvarchar](100) NULL,
	[ChequeNo] [nvarchar](100) NULL,
	[ChequeDate] [datetime] NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](2000) NULL,
	[Flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsPostDatedCheques] PRIMARY KEY CLUSTERED 
(
	[PostDatedChequeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsPurchaseInvoiceDetails]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsPurchaseInvoiceDetails](
	[PurchaseInvoiceDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[PurchaseInvoiceID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PurchaseInvoiceDetailUnit] [int] NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[RateFC] [decimal](18, 2) NOT NULL,
	[DetailValue] [decimal](18, 2) NOT NULL,
	[DetailValueFC] [decimal](18, 2) NOT NULL,
	[Tax] [int] NOT NULL,
	[NetValue] [decimal](18, 2) NOT NULL,
	[AccountHeadID] [int] NOT NULL,
	[DetailJob] [nvarchar](1000) NULL,
	[ProductsServices] [nvarchar](1000) NULL,
	[Flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsPurchaseInvoiceDetails] PRIMARY KEY CLUSTERED 
(
	[PurchaseInvoiceDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsPurchaseInvoices]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsPurchaseInvoices](
	[PurchaseInvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [nvarchar](100) NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[SupplierID] [int] NOT NULL,
	[ExternalReference] [nvarchar](100) NULL,
	[QuotationNoDate] [nvarchar](100) NULL,
	[LPONoDate] [nvarchar](100) NULL,
	[CurrencyID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[GrossTotalAmount] [decimal](18, 2) NOT NULL,
	[DiscountTypeID] [int] NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[VatAmount] [decimal](18, 2) NOT NULL,
	[NetTotalAmount] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](2000) NULL,
	[Flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsPurchaseInvoices] PRIMARY KEY CLUSTERED 
(
	[PurchaseInvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsRevenueTypes]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsRevenueTypes](
	[RevenueTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsRevenueTypes] PRIMARY KEY CLUSTERED 
(
	[RevenueTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsRoles]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsRoles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsSalaryBookEmployee]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsSalaryBookEmployee](
	[SalaryBookID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Dop] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsSalaryBookEmployee] PRIMARY KEY CLUSTERED 
(
	[SalaryBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsSalaryBookTeacher]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsSalaryBookTeacher](
	[SalaryBookID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Dop] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsSalaryBookTeacher] PRIMARY KEY CLUSTERED 
(
	[SalaryBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsSchools]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsSchools](
	[SchoolID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ShortName] [nvarchar](6) NOT NULL,
	[HouseNo] [nvarchar](500) NULL,
	[BuildingName] [nvarchar](500) NULL,
	[Street] [nvarchar](500) NULL,
	[Area] [nvarchar](500) NULL,
	[Location] [nvarchar](500) NULL,
	[CityID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[PinCode] [nvarchar](50) NULL,
	[Landline] [nvarchar](50) NULL,
	[Mobile] [nvarchar](100) NULL,
	[Website] [nvarchar](500) NULL,
	[RegNo] [nvarchar](500) NULL,
	[Logo] [nvarchar](4000) NULL,
	[Principal] [nvarchar](100) NOT NULL,
	[UserID] [int] NOT NULL,
	[CompanyAcademicYearID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsSchools] PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsSections]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsSections](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsSections] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsStudentAssignments]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsStudentAssignments](
	[StudentAssignmentID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Detail] [nvarchar](4000) NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.smsStudentAssignments] PRIMARY KEY CLUSTERED 
(
	[StudentAssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsStudentAssignmentSubmissions]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsStudentAssignmentSubmissions](
	[StudentAssignmentSubmissionID] [int] IDENTITY(1,1) NOT NULL,
	[StudentAssignmentID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Remarks] [nvarchar](4000) NOT NULL,
	[SubmittedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsStudentAssignmentSubmissions] PRIMARY KEY CLUSTERED 
(
	[StudentAssignmentSubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsStudentAttendances]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsStudentAttendances](
	[StudentAttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceTypeID] [int] NOT NULL,
	[AttendanceDate] [datetime] NOT NULL,
	[StudentID] [int] NOT NULL,
	[IdCard] [nvarchar](100) NULL,
	[UserID] [int] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[Percentage] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.smsStudentAttendances] PRIMARY KEY CLUSTERED 
(
	[StudentAttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsStudents]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsStudents](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IdCard] [nvarchar](100) NULL,
	[Dob] [datetime] NOT NULL,
	[Mobile] [nvarchar](100) NULL,
	[ClassID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[GuardianName] [nvarchar](100) NULL,
	[GuardianMobile] [nvarchar](100) NULL,
	[GuardianEmail] [nvarchar](100) NULL,
	[Parent2Name] [nvarchar](100) NULL,
	[Parent2Mobile] [nvarchar](100) NULL,
	[Parent2Email] [nvarchar](100) NULL,
	[Photo] [nvarchar](4000) NULL,
	[SchoolID] [int] NOT NULL,
	[ParentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Fee] [decimal](18, 2) NOT NULL,
	[FeeInstalments] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsStudents] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsSubjects]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsSubjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsSubjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsSubMenu]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsSubMenu](
	[SubMenuID] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuName] [nvarchar](100) NOT NULL,
	[SubMenuName2] [nvarchar](100) NULL,
	[Controller] [nvarchar](100) NOT NULL,
	[Action] [nvarchar](100) NOT NULL,
	[MainMenuID] [int] NOT NULL,
	[SubMenuRoles] [nvarchar](max) NULL,
	[SubMenuStatus] [bit] NOT NULL,
	[SubMenuOrder] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsSubMenu] PRIMARY KEY CLUSTERED 
(
	[SubMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsSuppliers]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsSuppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsSuppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTaskEmployees]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTaskEmployees](
	[TaskEmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[TaskListID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsTaskEmployees] PRIMARY KEY CLUSTERED 
(
	[TaskEmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTaskPriorities]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTaskPriorities](
	[TaskPriorityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsTaskPriorities] PRIMARY KEY CLUSTERED 
(
	[TaskPriorityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTaskStatuses]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTaskStatuses](
	[TaskStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsTaskStatuses] PRIMARY KEY CLUSTERED 
(
	[TaskStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTaskTaskLists]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTaskTaskLists](
	[TaskListID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ListDetail] [nvarchar](max) NULL,
	[TaskTypeID] [int] NOT NULL,
	[TaskPriorityID] [int] NOT NULL,
	[TaskStatusID] [int] NOT NULL,
	[ListDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsTaskTaskLists] PRIMARY KEY CLUSTERED 
(
	[TaskListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTaskTypes]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTaskTypes](
	[TaskTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsTaskTypes] PRIMARY KEY CLUSTERED 
(
	[TaskTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTeacherAttendances]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTeacherAttendances](
	[TeacherAttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceTypeID] [int] NOT NULL,
	[AttendanceDate] [datetime] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsTeacherAttendances] PRIMARY KEY CLUSTERED 
(
	[TeacherAttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTeachers]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTeachers](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IdCard] [nvarchar](100) NULL,
	[HouseNo] [nvarchar](500) NULL,
	[BuildingName] [nvarchar](500) NULL,
	[Street] [nvarchar](500) NULL,
	[Area] [nvarchar](500) NULL,
	[Location] [nvarchar](500) NULL,
	[CityID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[PinCode] [nvarchar](50) NULL,
	[Landline] [nvarchar](50) NULL,
	[Mobile] [nvarchar](100) NULL,
	[Photo] [nvarchar](4000) NULL,
	[SchoolID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[LeavesToAvail] [int] NOT NULL,
	[Salary] [decimal](18, 2) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsTeachers] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTimeTables]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTimeTables](
	[TimeTableID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[PeriodID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[isClassTeacher] [bit] NOT NULL,
	[Employee_EmployeeID] [int] NULL,
 CONSTRAINT [PK_dbo.smsTimeTables] PRIMARY KEY CLUSTERED 
(
	[TimeTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTokens]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTokens](
	[TokenID] [int] IDENTITY(1,1) NOT NULL,
	[TokenKey] [nvarchar](max) NULL,
	[IssuedOn] [datetime] NOT NULL,
	[ExpiresOn] [datetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[SchoolID] [int] NOT NULL,
	[AcademicYearID] [int] NOT NULL,
	[Company] [nvarchar](max) NULL,
	[CompanyLogo] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.smsTokens] PRIMARY KEY CLUSTERED 
(
	[TokenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTokensManager]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTokensManager](
	[TokenID] [int] IDENTITY(1,1) NOT NULL,
	[TokenKey] [nvarchar](max) NULL,
	[IssuedOn] [datetime] NOT NULL,
	[ExpiresOn] [datetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CompanyID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsTokensManager] PRIMARY KEY CLUSTERED 
(
	[TokenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTopics]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTopics](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ChapterID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsTopics] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTransactionTypes]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTransactionTypes](
	[TransactionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsTransactionTypes] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsTrialBalances]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsTrialBalances](
	[TrialBalanceID] [int] IDENTITY(1,1) NOT NULL,
	[Col1] [nvarchar](1000) NULL,
	[Col2] [nvarchar](100) NULL,
	[Col3] [nvarchar](100) NULL,
	[Address] [nvarchar](1000) NULL,
	[EndDate] [nvarchar](100) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsTrialBalances] PRIMARY KEY CLUSTERED 
(
	[TrialBalanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsUserPagePermissions]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsUserPagePermissions](
	[UserPagePermissionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PageName] [nvarchar](100) NULL,
	[PageUrl] [nvarchar](100) NULL,
	[CanView] [bit] NOT NULL,
	[CanCreate] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[CanPrint] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.smsUserPagePermissions] PRIMARY KEY CLUSTERED 
(
	[UserPagePermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsUserPageViews]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsUserPageViews](
	[UserPageViewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PageUrl] [nvarchar](500) NULL,
	[DateAccessed] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsUserPageViews] PRIMARY KEY CLUSTERED 
(
	[UserPageViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsUserRoles]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsUserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.smsUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsUsers]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[CanCreate] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[CanPrint] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastLoggedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.smsUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsVideos]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsVideos](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[FileExt] [nvarchar](10) NULL,
	[VideoPath] [nvarchar](4000) NOT NULL,
	[YoutubePath] [nvarchar](4000) NULL,
	[UserID] [int] NOT NULL,
	[Dou] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.smsVideos] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsVoucherTypes]    Script Date: 11/24/2018 7:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsVoucherTypes](
	[VoucherTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.smsVoucherTypes] PRIMARY KEY CLUSTERED 
(
	[VoucherTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[smsAcademicYears] ON 

GO
INSERT [dbo].[smsAcademicYears] ([AcademicYearID], [Name], [YearFrom], [YearTo]) VALUES (1, N'01 Jan 2018 - 31 Dec 2018', CAST(N'2018-01-01 00:00:00.000' AS DateTime), CAST(N'2018-12-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsAcademicYears] ([AcademicYearID], [Name], [YearFrom], [YearTo]) VALUES (2, N'01 Jan 2019 - 31 Dec 2019', CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2019-12-01 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsAcademicYears] OFF
GO
SET IDENTITY_INSERT [dbo].[smsAccountCategories] ON 

GO
INSERT [dbo].[smsAccountCategories] ([AccountCategoryID], [Name]) VALUES (1, N'ASSETS')
GO
INSERT [dbo].[smsAccountCategories] ([AccountCategoryID], [Name]) VALUES (2, N'LIABILITY')
GO
INSERT [dbo].[smsAccountCategories] ([AccountCategoryID], [Name]) VALUES (3, N'INCOME')
GO
INSERT [dbo].[smsAccountCategories] ([AccountCategoryID], [Name]) VALUES (4, N'EXPENDITURE')
GO
INSERT [dbo].[smsAccountCategories] ([AccountCategoryID], [Name]) VALUES (5, N'EQUITY')
GO
SET IDENTITY_INSERT [dbo].[smsAccountCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[smsAccountGroups] ON 

GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (1, N'CASH', 3)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (2, N'BANK', 3)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (3, N'REVENUE', 2)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (4, N'CURRENT ASSET', 1)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (5, N'FIXED ASSET', 1)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (6, N'LONG TERM LIABILITY', 2)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (7, N'SHORT TERM LIABILITY', 2)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (8, N'DIRECT INCOME', 3)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (9, N'DIRECT EXPENSE', 4)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (10, N'INDIRECT EXPENSE', 4)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (11, N'DIRECTORS CAPITAL', 5)
GO
INSERT [dbo].[smsAccountGroups] ([AccountGroupID], [Name], [AccountCategoryID]) VALUES (12, N'DIRECTERS DRAWING', 5)
GO
SET IDENTITY_INSERT [dbo].[smsAccountGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[smsAccountHeadAssign] ON 

GO
INSERT [dbo].[smsAccountHeadAssign] ([HeadAssignID], [RevenueType], [Name], [AccountHeadID]) VALUES (1, N'fees', N'Fee Debit Account', 7)
GO
INSERT [dbo].[smsAccountHeadAssign] ([HeadAssignID], [RevenueType], [Name], [AccountHeadID]) VALUES (2, N'fees', N'Fee Credit Account', 9)
GO
INSERT [dbo].[smsAccountHeadAssign] ([HeadAssignID], [RevenueType], [Name], [AccountHeadID]) VALUES (3, N'salary', N'Salary Debit Account', 1)
GO
INSERT [dbo].[smsAccountHeadAssign] ([HeadAssignID], [RevenueType], [Name], [AccountHeadID]) VALUES (4, N'salary', N'Salary Credit Account', 4)
GO
SET IDENTITY_INSERT [dbo].[smsAccountHeadAssign] OFF
GO
SET IDENTITY_INSERT [dbo].[smsAccountHeads] ON 

GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (1, N'CASH ON HAND', 1)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (2, N'CHEQUE ON HAND', 2)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (3, N'RENT REVENUE', 3)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (4, N'COMMISION REVENUE', 3)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (5, N'UTILITIES DEPOSIT', 2)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (6, N'SECURITY DEPOSIT', 2)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (7, N'BANK ACCOUNT', 2)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (8, N'RENT SETTLEMENT', 3)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (9, N'CASH ACCOUNT MAIN', 4)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (10, N'PETTY CASH ACCOUNT', 4)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (11, N'STOCK ON HAND', 4)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (12, N'FURNITURE AND FIXTURES', 5)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (13, N'FA VEHICLES', 5)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (14, N'STATUTURY RESERVE', 6)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (15, N'VEHICLE LOAN', 7)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (16, N'SALES DOMESTIC', 8)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (17, N'CUSTOM DUTY', 9)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (18, N'FUEL AND GAS', 10)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (19, N'VISA EXPENSE', 10)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (20, N'OPENING BALANCE', 11)
GO
INSERT [dbo].[smsAccountHeads] ([AccountHeadID], [Name], [AccountGroupID]) VALUES (21, N'STATIONERY', 12)
GO
SET IDENTITY_INSERT [dbo].[smsAccountHeads] OFF
GO
SET IDENTITY_INSERT [dbo].[smsAccountJournalDetails] ON 

GO
INSERT [dbo].[smsAccountJournalDetails] ([AccountJournalDetailID], [AccountJournalID], [AccountHeadID], [AnalysisHeadID], [Amount], [Remarks]) VALUES (1, 1, 7, 0, CAST(20000.00 AS Decimal(18, 2)), N'Employee Salary: Demo Employee 1, Detail: December Salary, salary Debit')
GO
INSERT [dbo].[smsAccountJournalDetails] ([AccountJournalDetailID], [AccountJournalID], [AccountHeadID], [AnalysisHeadID], [Amount], [Remarks]) VALUES (2, 1, 9, 0, CAST(-20000.00 AS Decimal(18, 2)), N'Employee Salary: Demo Employee 1, Detail: December Salary, salary credit')
GO
INSERT [dbo].[smsAccountJournalDetails] ([AccountJournalDetailID], [AccountJournalID], [AccountHeadID], [AnalysisHeadID], [Amount], [Remarks]) VALUES (3, 2, 7, 0, CAST(16666.67 AS Decimal(18, 2)), N'Student Fee: Master Student Eight, Detail: December Fees Pais, fee Debit')
GO
INSERT [dbo].[smsAccountJournalDetails] ([AccountJournalDetailID], [AccountJournalID], [AccountHeadID], [AnalysisHeadID], [Amount], [Remarks]) VALUES (4, 2, 9, 0, CAST(-16666.67 AS Decimal(18, 2)), N'Student Fee: Master Student Eight, Detail: December Fees Pais, fee credit')
GO
INSERT [dbo].[smsAccountJournalDetails] ([AccountJournalDetailID], [AccountJournalID], [AccountHeadID], [AnalysisHeadID], [Amount], [Remarks]) VALUES (5, 3, 7, 0, CAST(10000.00 AS Decimal(18, 2)), N'Teacher Salary: Mr Teacher One, Detail: December Salary paid, salary Debit')
GO
INSERT [dbo].[smsAccountJournalDetails] ([AccountJournalDetailID], [AccountJournalID], [AccountHeadID], [AnalysisHeadID], [Amount], [Remarks]) VALUES (6, 3, 9, 0, CAST(-10000.00 AS Decimal(18, 2)), N'Teacher Salary: Mr Teacher One, Detail: December Salary paid, salary credit')
GO
SET IDENTITY_INSERT [dbo].[smsAccountJournalDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[smsAccountJournals] ON 

GO
INSERT [dbo].[smsAccountJournals] ([AccountJournalID], [VoucherNo], [VoucherType], [TransactionDate], [BranchID], [FinancialYearID], [UserID], [Remarks]) VALUES (1, N'EMDSTEA000002-2', N'EM', CAST(N'2018-11-30 00:00:00.000' AS DateTime), 1, 1, N'1', N'Employee Salary')
GO
INSERT [dbo].[smsAccountJournals] ([AccountJournalID], [VoucherNo], [VoucherType], [TransactionDate], [BranchID], [FinancialYearID], [UserID], [Remarks]) VALUES (2, N'STDSSTU000008-1', N'ST', CAST(N'2018-11-30 00:00:00.000' AS DateTime), 1, 1, N'1', N'Student Fee')
GO
INSERT [dbo].[smsAccountJournals] ([AccountJournalID], [VoucherNo], [VoucherType], [TransactionDate], [BranchID], [FinancialYearID], [UserID], [Remarks]) VALUES (3, N'EMDSTEA000001-1', N'EM', CAST(N'2018-11-30 00:00:00.000' AS DateTime), 1, 1, N'1', N'Teacher Salary')
GO
SET IDENTITY_INSERT [dbo].[smsAccountJournals] OFF
GO
SET IDENTITY_INSERT [dbo].[smsAllocationGroups] ON 

GO
INSERT [dbo].[smsAllocationGroups] ([AllocationGroupID], [Name]) VALUES (0, N'Select Group')
GO
SET IDENTITY_INSERT [dbo].[smsAllocationGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[smsAllocationTypes] ON 

GO
INSERT [dbo].[smsAllocationTypes] ([AllocationTypeID], [Name], [AllocationGroupID]) VALUES (0, N'Select Type', 0)
GO
SET IDENTITY_INSERT [dbo].[smsAllocationTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[smsAnalysisGroups] ON 

GO
INSERT [dbo].[smsAnalysisGroups] ([AnalysisGroupID], [Name]) VALUES (1, N'RESOURCES')
GO
INSERT [dbo].[smsAnalysisGroups] ([AnalysisGroupID], [Name]) VALUES (2, N'COST CENTER')
GO
SET IDENTITY_INSERT [dbo].[smsAnalysisGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[smsAttendanceTypes] ON 

GO
INSERT [dbo].[smsAttendanceTypes] ([AttendanceTypeID], [Name]) VALUES (1, N'Present')
GO
INSERT [dbo].[smsAttendanceTypes] ([AttendanceTypeID], [Name]) VALUES (2, N'Absent')
GO
INSERT [dbo].[smsAttendanceTypes] ([AttendanceTypeID], [Name]) VALUES (3, N'Leave')
GO
SET IDENTITY_INSERT [dbo].[smsAttendanceTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[smsBankDepositStatuses] ON 

GO
INSERT [dbo].[smsBankDepositStatuses] ([BankDepositStatusID], [Name]) VALUES (0, N'INACTIVE')
GO
INSERT [dbo].[smsBankDepositStatuses] ([BankDepositStatusID], [Name]) VALUES (1, N'DELETED')
GO
INSERT [dbo].[smsBankDepositStatuses] ([BankDepositStatusID], [Name]) VALUES (2, N'DEPOSITED')
GO
INSERT [dbo].[smsBankDepositStatuses] ([BankDepositStatusID], [Name]) VALUES (3, N'DISHONOURED')
GO
INSERT [dbo].[smsBankDepositStatuses] ([BankDepositStatusID], [Name]) VALUES (4, N'REPLACED')
GO
INSERT [dbo].[smsBankDepositStatuses] ([BankDepositStatusID], [Name]) VALUES (5, N'REALISED')
GO
SET IDENTITY_INSERT [dbo].[smsBankDepositStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[smsBanks] ON 

GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (0, N'Demo Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (1, N'China Industrial and Commercial Bank of China')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (2, N'China China Construction Bank Corporation')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (3, N'China Agricultural Bank of China')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (4, N'China Bank of China')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (5, N'Japan Mitsubishi UFJ Financial Group')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (6, N'United States JPMorgan Chase & Co.')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (7, N'United Kingdom HSBC Holdings PLC')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (8, N'France BNP Paribas')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (9, N'United States Bank of America')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (10, N'France Crédit Agricole')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (11, N'United States Wells Fargo & Co.')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (12, N'Japan Japan Post Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (13, N'United States Citigroup Inc.')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (14, N'Japan Sumitomo Mitsui Financial Group')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (15, N'Germany Deutsche Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (16, N'Spain Banco Santander')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (17, N'Japan Mizuho Financial Group')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (18, N'United Kingdom Barclays PLC')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (19, N'France Société Générale')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (20, N'France Groupe BPCE')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (21, N'China Bank of Communications')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (22, N'China Postal Savings Bank of China')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (23, N'United Kingdom Lloyds Banking Group')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (24, N'Canada Royal Bank of Canada')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (25, N'Canada Toronto-Dominion Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (26, N'Netherlands ING Group')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (27, N'Japan Norinchukin Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (28, N'Italy UniCredit')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (29, N'United Kingdom Royal Bank of Scotland Group')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (30, N'China Industrial Bank (China)')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (31, N'China China Merchants Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (32, N'Italy Intesa Sanpaolo')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (33, N'China Shanghai Pudong Development Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (34, N'Switzerland UBS')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (35, N'United States Goldman Sachs')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (36, N'China China Minsheng Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (37, N'China China CITIC Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (38, N'United States Morgan Stanley')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (39, N'France Crédit Mutuel')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (40, N'Switzerland Credit Suisse')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (41, N'Spain Banco Bilbao Vizcaya Argentaria')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (42, N'Canada Scotiabank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (43, N'Australia Commonwealth Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (44, N'Netherlands Rabobank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (45, N'Australia Australia and New Zealand Banking Group')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (46, N'Sweden Nordea')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (47, N'Australia Westpac')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (48, N'United Kingdom Standard Chartered')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (49, N'China China Everbright Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (50, N'Australia National Australia Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (51, N'Germany DZ Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (52, N'Canada Bank of Montreal')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (53, N'Denmark Danske Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (54, N'Germany Commerzbank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (55, N'India State Bank of India ')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (56, N'Japan Resona Holdings')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (57, N'Italy Cassa Depositi e Prestiti')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (58, N'China Ping An Bank')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (59, N'Canada Canadian Imperial Bank of Commerce')
GO
INSERT [dbo].[smsBanks] ([BankID], [Name]) VALUES (60, N'Japan Sumitomo Mitsui Trust Holdings')
GO
SET IDENTITY_INSERT [dbo].[smsBanks] OFF
GO
SET IDENTITY_INSERT [dbo].[smsCalendars] ON 

GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (1, CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (2, CAST(N'2018-01-02 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (3, CAST(N'2018-01-03 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (4, CAST(N'2018-01-04 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (5, CAST(N'2018-01-05 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (6, CAST(N'2018-01-06 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (7, CAST(N'2018-01-07 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (8, CAST(N'2018-01-08 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (9, CAST(N'2018-01-09 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (10, CAST(N'2018-01-10 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (11, CAST(N'2018-01-11 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (12, CAST(N'2018-01-12 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (13, CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (14, CAST(N'2018-01-14 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (15, CAST(N'2018-01-15 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (16, CAST(N'2018-01-16 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (17, CAST(N'2018-01-17 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (18, CAST(N'2018-01-18 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (19, CAST(N'2018-01-19 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (20, CAST(N'2018-01-20 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (21, CAST(N'2018-01-21 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (22, CAST(N'2018-01-22 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (23, CAST(N'2018-01-23 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (24, CAST(N'2018-01-24 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (25, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (26, CAST(N'2018-01-26 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (27, CAST(N'2018-01-27 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (28, CAST(N'2018-01-28 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (29, CAST(N'2018-01-29 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (30, CAST(N'2018-01-30 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (31, CAST(N'2018-01-31 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (32, CAST(N'2018-02-01 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (33, CAST(N'2018-02-02 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (34, CAST(N'2018-02-03 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (35, CAST(N'2018-02-04 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (36, CAST(N'2018-02-05 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (37, CAST(N'2018-02-06 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (38, CAST(N'2018-02-07 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (39, CAST(N'2018-02-08 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (40, CAST(N'2018-02-09 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (41, CAST(N'2018-02-10 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (42, CAST(N'2018-02-11 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (43, CAST(N'2018-02-12 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (44, CAST(N'2018-02-13 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (45, CAST(N'2018-02-14 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (46, CAST(N'2018-02-15 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (47, CAST(N'2018-02-16 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (48, CAST(N'2018-02-17 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (49, CAST(N'2018-02-18 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (50, CAST(N'2018-02-19 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (51, CAST(N'2018-02-20 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (52, CAST(N'2018-02-21 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (53, CAST(N'2018-02-22 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (54, CAST(N'2018-02-23 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (55, CAST(N'2018-02-24 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (56, CAST(N'2018-02-25 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (57, CAST(N'2018-02-26 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (58, CAST(N'2018-02-27 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (59, CAST(N'2018-02-28 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (60, CAST(N'2018-03-01 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (61, CAST(N'2018-03-02 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (62, CAST(N'2018-03-03 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (63, CAST(N'2018-03-04 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (64, CAST(N'2018-03-05 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (65, CAST(N'2018-03-06 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (66, CAST(N'2018-03-07 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (67, CAST(N'2018-03-08 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (68, CAST(N'2018-03-09 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (69, CAST(N'2018-03-10 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (70, CAST(N'2018-03-11 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (71, CAST(N'2018-03-12 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (72, CAST(N'2018-03-13 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (73, CAST(N'2018-03-14 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (74, CAST(N'2018-03-15 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (75, CAST(N'2018-03-16 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (76, CAST(N'2018-03-17 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (77, CAST(N'2018-03-18 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (78, CAST(N'2018-03-19 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (79, CAST(N'2018-03-20 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (80, CAST(N'2018-03-21 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (81, CAST(N'2018-03-22 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (82, CAST(N'2018-03-23 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (83, CAST(N'2018-03-24 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (84, CAST(N'2018-03-25 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (85, CAST(N'2018-03-26 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (86, CAST(N'2018-03-27 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (87, CAST(N'2018-03-28 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (88, CAST(N'2018-03-29 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (89, CAST(N'2018-03-30 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (90, CAST(N'2018-03-31 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (91, CAST(N'2018-04-01 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (92, CAST(N'2018-04-02 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (93, CAST(N'2018-04-03 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (94, CAST(N'2018-04-04 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (95, CAST(N'2018-04-05 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (96, CAST(N'2018-04-06 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (97, CAST(N'2018-04-07 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (98, CAST(N'2018-04-08 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (99, CAST(N'2018-04-09 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (100, CAST(N'2018-04-10 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (101, CAST(N'2018-04-11 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (102, CAST(N'2018-04-12 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (103, CAST(N'2018-04-13 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (104, CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (105, CAST(N'2018-04-15 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (106, CAST(N'2018-04-16 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (107, CAST(N'2018-04-17 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (108, CAST(N'2018-04-18 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (109, CAST(N'2018-04-19 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (110, CAST(N'2018-04-20 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (111, CAST(N'2018-04-21 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (112, CAST(N'2018-04-22 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (113, CAST(N'2018-04-23 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (114, CAST(N'2018-04-24 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (115, CAST(N'2018-04-25 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (116, CAST(N'2018-04-26 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (117, CAST(N'2018-04-27 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (118, CAST(N'2018-04-28 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (119, CAST(N'2018-04-29 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (120, CAST(N'2018-04-30 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (121, CAST(N'2018-05-01 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (122, CAST(N'2018-05-02 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (123, CAST(N'2018-05-03 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (124, CAST(N'2018-05-04 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (125, CAST(N'2018-05-05 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (126, CAST(N'2018-05-06 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (127, CAST(N'2018-05-07 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (128, CAST(N'2018-05-08 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (129, CAST(N'2018-05-09 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (130, CAST(N'2018-05-10 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (131, CAST(N'2018-05-11 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (132, CAST(N'2018-05-12 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (133, CAST(N'2018-05-13 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (134, CAST(N'2018-05-14 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (135, CAST(N'2018-05-15 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (136, CAST(N'2018-05-16 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (137, CAST(N'2018-05-17 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (138, CAST(N'2018-05-18 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (139, CAST(N'2018-05-19 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (140, CAST(N'2018-05-20 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (141, CAST(N'2018-05-21 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (142, CAST(N'2018-05-22 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (143, CAST(N'2018-05-23 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (144, CAST(N'2018-05-24 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (145, CAST(N'2018-05-25 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (146, CAST(N'2018-05-26 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (147, CAST(N'2018-05-27 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (148, CAST(N'2018-05-28 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (149, CAST(N'2018-05-29 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (150, CAST(N'2018-05-30 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (151, CAST(N'2018-05-31 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (152, CAST(N'2018-06-01 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (153, CAST(N'2018-06-02 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (154, CAST(N'2018-06-03 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (155, CAST(N'2018-06-04 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (156, CAST(N'2018-06-05 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (157, CAST(N'2018-06-06 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (158, CAST(N'2018-06-07 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (159, CAST(N'2018-06-08 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (160, CAST(N'2018-06-09 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (161, CAST(N'2018-06-10 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (162, CAST(N'2018-06-11 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (163, CAST(N'2018-06-12 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (164, CAST(N'2018-06-13 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (165, CAST(N'2018-06-14 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (166, CAST(N'2018-06-15 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (167, CAST(N'2018-06-16 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (168, CAST(N'2018-06-17 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (169, CAST(N'2018-06-18 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (170, CAST(N'2018-06-19 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (171, CAST(N'2018-06-20 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (172, CAST(N'2018-06-21 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (173, CAST(N'2018-06-22 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (174, CAST(N'2018-06-23 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (175, CAST(N'2018-06-24 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (176, CAST(N'2018-06-25 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (177, CAST(N'2018-06-26 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (178, CAST(N'2018-06-27 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (179, CAST(N'2018-06-28 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (180, CAST(N'2018-06-29 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (181, CAST(N'2018-06-30 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (182, CAST(N'2018-07-01 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (183, CAST(N'2018-07-02 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (184, CAST(N'2018-07-03 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (185, CAST(N'2018-07-04 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (186, CAST(N'2018-07-05 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (187, CAST(N'2018-07-06 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (188, CAST(N'2018-07-07 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (189, CAST(N'2018-07-08 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (190, CAST(N'2018-07-09 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (191, CAST(N'2018-07-10 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (192, CAST(N'2018-07-11 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (193, CAST(N'2018-07-12 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (194, CAST(N'2018-07-13 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (195, CAST(N'2018-07-14 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (196, CAST(N'2018-07-15 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (197, CAST(N'2018-07-16 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (198, CAST(N'2018-07-17 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (199, CAST(N'2018-07-18 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (200, CAST(N'2018-07-19 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (201, CAST(N'2018-07-20 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (202, CAST(N'2018-07-21 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (203, CAST(N'2018-07-22 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (204, CAST(N'2018-07-23 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (205, CAST(N'2018-07-24 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (206, CAST(N'2018-07-25 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (207, CAST(N'2018-07-26 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (208, CAST(N'2018-07-27 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (209, CAST(N'2018-07-28 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (210, CAST(N'2018-07-29 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (211, CAST(N'2018-07-30 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (212, CAST(N'2018-07-31 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (213, CAST(N'2018-08-01 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (214, CAST(N'2018-08-02 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (215, CAST(N'2018-08-03 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (216, CAST(N'2018-08-04 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (217, CAST(N'2018-08-05 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (218, CAST(N'2018-08-06 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (219, CAST(N'2018-08-07 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (220, CAST(N'2018-08-08 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (221, CAST(N'2018-08-09 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (222, CAST(N'2018-08-10 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (223, CAST(N'2018-08-11 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (224, CAST(N'2018-08-12 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (225, CAST(N'2018-08-13 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (226, CAST(N'2018-08-14 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (227, CAST(N'2018-08-15 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (228, CAST(N'2018-08-16 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (229, CAST(N'2018-08-17 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (230, CAST(N'2018-08-18 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (231, CAST(N'2018-08-19 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (232, CAST(N'2018-08-20 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (233, CAST(N'2018-08-21 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (234, CAST(N'2018-08-22 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (235, CAST(N'2018-08-23 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (236, CAST(N'2018-08-24 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (237, CAST(N'2018-08-25 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (238, CAST(N'2018-08-26 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (239, CAST(N'2018-08-27 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (240, CAST(N'2018-08-28 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (241, CAST(N'2018-08-29 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (242, CAST(N'2018-08-30 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (243, CAST(N'2018-08-31 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (244, CAST(N'2018-09-01 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (245, CAST(N'2018-09-02 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (246, CAST(N'2018-09-03 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (247, CAST(N'2018-09-04 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (248, CAST(N'2018-09-05 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (249, CAST(N'2018-09-06 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (250, CAST(N'2018-09-07 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (251, CAST(N'2018-09-08 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (252, CAST(N'2018-09-09 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (253, CAST(N'2018-09-10 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (254, CAST(N'2018-09-11 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (255, CAST(N'2018-09-12 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (256, CAST(N'2018-09-13 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (257, CAST(N'2018-09-14 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (258, CAST(N'2018-09-15 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (259, CAST(N'2018-09-16 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (260, CAST(N'2018-09-17 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (261, CAST(N'2018-09-18 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (262, CAST(N'2018-09-19 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (263, CAST(N'2018-09-20 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (264, CAST(N'2018-09-21 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (265, CAST(N'2018-09-22 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (266, CAST(N'2018-09-23 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (267, CAST(N'2018-09-24 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (268, CAST(N'2018-09-25 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (269, CAST(N'2018-09-26 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (270, CAST(N'2018-09-27 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (271, CAST(N'2018-09-28 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (272, CAST(N'2018-09-29 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (273, CAST(N'2018-09-30 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (274, CAST(N'2018-10-01 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (275, CAST(N'2018-10-02 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (276, CAST(N'2018-10-03 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (277, CAST(N'2018-10-04 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (278, CAST(N'2018-10-05 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (279, CAST(N'2018-10-06 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (280, CAST(N'2018-10-07 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (281, CAST(N'2018-10-08 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (282, CAST(N'2018-10-09 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (283, CAST(N'2018-10-10 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (284, CAST(N'2018-10-11 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (285, CAST(N'2018-10-12 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (286, CAST(N'2018-10-13 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (287, CAST(N'2018-10-14 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (288, CAST(N'2018-10-15 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (289, CAST(N'2018-10-16 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (290, CAST(N'2018-10-17 00:00:00.000' AS DateTime), N'Wednesday', N'BATHUKAMMA', N'Local festival', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (291, CAST(N'2018-10-18 00:00:00.000' AS DateTime), N'Thursday', N'DASAHERA', N'National festival', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (292, CAST(N'2018-10-19 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (293, CAST(N'2018-10-20 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (294, CAST(N'2018-10-21 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (295, CAST(N'2018-10-22 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (296, CAST(N'2018-10-23 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (297, CAST(N'2018-10-24 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (298, CAST(N'2018-10-25 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (299, CAST(N'2018-10-26 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (300, CAST(N'2018-10-27 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (301, CAST(N'2018-10-28 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (302, CAST(N'2018-10-29 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (303, CAST(N'2018-10-30 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (304, CAST(N'2018-10-31 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (305, CAST(N'2018-11-01 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (306, CAST(N'2018-11-02 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (307, CAST(N'2018-11-03 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (308, CAST(N'2018-11-04 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (309, CAST(N'2018-11-05 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (310, CAST(N'2018-11-06 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (311, CAST(N'2018-11-07 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (312, CAST(N'2018-11-08 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (313, CAST(N'2018-11-09 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (314, CAST(N'2018-11-10 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (315, CAST(N'2018-11-11 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (316, CAST(N'2018-11-12 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (317, CAST(N'2018-11-13 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (318, CAST(N'2018-11-14 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (319, CAST(N'2018-11-15 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (320, CAST(N'2018-11-16 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (321, CAST(N'2018-11-17 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (322, CAST(N'2018-11-18 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (323, CAST(N'2018-11-19 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (324, CAST(N'2018-11-20 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (325, CAST(N'2018-11-21 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (326, CAST(N'2018-11-22 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (327, CAST(N'2018-11-23 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (328, CAST(N'2018-11-24 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (329, CAST(N'2018-11-25 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (330, CAST(N'2018-11-26 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (331, CAST(N'2018-11-27 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (332, CAST(N'2018-11-28 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (333, CAST(N'2018-11-29 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (334, CAST(N'2018-11-30 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (335, CAST(N'2018-12-01 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (336, CAST(N'2018-12-02 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (337, CAST(N'2018-12-03 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (338, CAST(N'2018-12-04 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (339, CAST(N'2018-12-05 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (340, CAST(N'2018-12-06 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (341, CAST(N'2018-12-07 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (342, CAST(N'2018-12-08 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (343, CAST(N'2018-12-09 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (344, CAST(N'2018-12-10 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (345, CAST(N'2018-12-11 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (346, CAST(N'2018-12-12 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (347, CAST(N'2018-12-13 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (348, CAST(N'2018-12-14 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (349, CAST(N'2018-12-15 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (350, CAST(N'2018-12-16 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (351, CAST(N'2018-12-17 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (352, CAST(N'2018-12-18 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (353, CAST(N'2018-12-19 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (354, CAST(N'2018-12-20 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (355, CAST(N'2018-12-21 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (356, CAST(N'2018-12-22 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (357, CAST(N'2018-12-23 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (358, CAST(N'2018-12-24 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (359, CAST(N'2018-12-25 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (360, CAST(N'2018-12-26 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (361, CAST(N'2018-12-27 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (362, CAST(N'2018-12-28 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (363, CAST(N'2018-12-29 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (364, CAST(N'2018-12-30 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (365, CAST(N'2018-12-31 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (366, CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (367, CAST(N'2019-01-02 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (368, CAST(N'2019-01-03 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (369, CAST(N'2019-01-04 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (370, CAST(N'2019-01-05 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (371, CAST(N'2019-01-06 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (372, CAST(N'2019-01-07 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (373, CAST(N'2019-01-08 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (374, CAST(N'2019-01-09 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (375, CAST(N'2019-01-10 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (376, CAST(N'2019-01-11 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (377, CAST(N'2019-01-12 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (378, CAST(N'2019-01-13 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (379, CAST(N'2019-01-14 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (380, CAST(N'2019-01-15 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (381, CAST(N'2019-01-16 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (382, CAST(N'2019-01-17 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (383, CAST(N'2019-01-18 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (384, CAST(N'2019-01-19 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (385, CAST(N'2019-01-20 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (386, CAST(N'2019-01-21 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (387, CAST(N'2019-01-22 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (388, CAST(N'2019-01-23 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (389, CAST(N'2019-01-24 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (390, CAST(N'2019-01-25 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (391, CAST(N'2019-01-26 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (392, CAST(N'2019-01-27 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (393, CAST(N'2019-01-28 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (394, CAST(N'2019-01-29 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (395, CAST(N'2019-01-30 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (396, CAST(N'2019-01-31 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (397, CAST(N'2019-02-01 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (398, CAST(N'2019-02-02 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (399, CAST(N'2019-02-03 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (400, CAST(N'2019-02-04 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (401, CAST(N'2019-02-05 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (402, CAST(N'2019-02-06 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (403, CAST(N'2019-02-07 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (404, CAST(N'2019-02-08 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (405, CAST(N'2019-02-09 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (406, CAST(N'2019-02-10 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (407, CAST(N'2019-02-11 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (408, CAST(N'2019-02-12 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (409, CAST(N'2019-02-13 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (410, CAST(N'2019-02-14 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (411, CAST(N'2019-02-15 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (412, CAST(N'2019-02-16 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (413, CAST(N'2019-02-17 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (414, CAST(N'2019-02-18 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (415, CAST(N'2019-02-19 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (416, CAST(N'2019-02-20 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (417, CAST(N'2019-02-21 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (418, CAST(N'2019-02-22 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (419, CAST(N'2019-02-23 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (420, CAST(N'2019-02-24 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (421, CAST(N'2019-02-25 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (422, CAST(N'2019-02-26 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (423, CAST(N'2019-02-27 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (424, CAST(N'2019-02-28 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (425, CAST(N'2019-03-01 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (426, CAST(N'2019-03-02 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (427, CAST(N'2019-03-03 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (428, CAST(N'2019-03-04 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (429, CAST(N'2019-03-05 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (430, CAST(N'2019-03-06 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (431, CAST(N'2019-03-07 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (432, CAST(N'2019-03-08 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (433, CAST(N'2019-03-09 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (434, CAST(N'2019-03-10 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (435, CAST(N'2019-03-11 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (436, CAST(N'2019-03-12 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (437, CAST(N'2019-03-13 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (438, CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (439, CAST(N'2019-03-15 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (440, CAST(N'2019-03-16 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (441, CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (442, CAST(N'2019-03-18 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (443, CAST(N'2019-03-19 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (444, CAST(N'2019-03-20 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (445, CAST(N'2019-03-21 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (446, CAST(N'2019-03-22 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (447, CAST(N'2019-03-23 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (448, CAST(N'2019-03-24 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (449, CAST(N'2019-03-25 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (450, CAST(N'2019-03-26 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (451, CAST(N'2019-03-27 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (452, CAST(N'2019-03-28 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (453, CAST(N'2019-03-29 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (454, CAST(N'2019-03-30 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (455, CAST(N'2019-03-31 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (456, CAST(N'2019-04-01 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (457, CAST(N'2019-04-02 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (458, CAST(N'2019-04-03 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (459, CAST(N'2019-04-04 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (460, CAST(N'2019-04-05 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (461, CAST(N'2019-04-06 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (462, CAST(N'2019-04-07 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (463, CAST(N'2019-04-08 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (464, CAST(N'2019-04-09 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (465, CAST(N'2019-04-10 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (466, CAST(N'2019-04-11 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (467, CAST(N'2019-04-12 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (468, CAST(N'2019-04-13 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (469, CAST(N'2019-04-14 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (470, CAST(N'2019-04-15 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (471, CAST(N'2019-04-16 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (472, CAST(N'2019-04-17 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (473, CAST(N'2019-04-18 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (474, CAST(N'2019-04-19 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (475, CAST(N'2019-04-20 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (476, CAST(N'2019-04-21 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (477, CAST(N'2019-04-22 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (478, CAST(N'2019-04-23 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (479, CAST(N'2019-04-24 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (480, CAST(N'2019-04-25 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (481, CAST(N'2019-04-26 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (482, CAST(N'2019-04-27 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (483, CAST(N'2019-04-28 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (484, CAST(N'2019-04-29 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (485, CAST(N'2019-04-30 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (486, CAST(N'2019-05-01 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (487, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (488, CAST(N'2019-05-03 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (489, CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (490, CAST(N'2019-05-05 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (491, CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (492, CAST(N'2019-05-07 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (493, CAST(N'2019-05-08 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (494, CAST(N'2019-05-09 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (495, CAST(N'2019-05-10 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (496, CAST(N'2019-05-11 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (497, CAST(N'2019-05-12 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (498, CAST(N'2019-05-13 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (499, CAST(N'2019-05-14 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (500, CAST(N'2019-05-15 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (501, CAST(N'2019-05-16 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (502, CAST(N'2019-05-17 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (503, CAST(N'2019-05-18 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (504, CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (505, CAST(N'2019-05-20 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (506, CAST(N'2019-05-21 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (507, CAST(N'2019-05-22 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (508, CAST(N'2019-05-23 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (509, CAST(N'2019-05-24 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (510, CAST(N'2019-05-25 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (511, CAST(N'2019-05-26 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (512, CAST(N'2019-05-27 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (513, CAST(N'2019-05-28 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (514, CAST(N'2019-05-29 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (515, CAST(N'2019-05-30 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (516, CAST(N'2019-05-31 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (517, CAST(N'2019-06-01 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (518, CAST(N'2019-06-02 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (519, CAST(N'2019-06-03 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (520, CAST(N'2019-06-04 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (521, CAST(N'2019-06-05 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (522, CAST(N'2019-06-06 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (523, CAST(N'2019-06-07 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (524, CAST(N'2019-06-08 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (525, CAST(N'2019-06-09 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (526, CAST(N'2019-06-10 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (527, CAST(N'2019-06-11 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (528, CAST(N'2019-06-12 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (529, CAST(N'2019-06-13 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (530, CAST(N'2019-06-14 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (531, CAST(N'2019-06-15 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (532, CAST(N'2019-06-16 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (533, CAST(N'2019-06-17 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (534, CAST(N'2019-06-18 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (535, CAST(N'2019-06-19 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (536, CAST(N'2019-06-20 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (537, CAST(N'2019-06-21 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (538, CAST(N'2019-06-22 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (539, CAST(N'2019-06-23 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (540, CAST(N'2019-06-24 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (541, CAST(N'2019-06-25 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (542, CAST(N'2019-06-26 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (543, CAST(N'2019-06-27 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (544, CAST(N'2019-06-28 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (545, CAST(N'2019-06-29 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (546, CAST(N'2019-06-30 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (547, CAST(N'2019-07-01 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (548, CAST(N'2019-07-02 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (549, CAST(N'2019-07-03 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (550, CAST(N'2019-07-04 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (551, CAST(N'2019-07-05 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (552, CAST(N'2019-07-06 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (553, CAST(N'2019-07-07 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (554, CAST(N'2019-07-08 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (555, CAST(N'2019-07-09 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (556, CAST(N'2019-07-10 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (557, CAST(N'2019-07-11 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (558, CAST(N'2019-07-12 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (559, CAST(N'2019-07-13 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (560, CAST(N'2019-07-14 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (561, CAST(N'2019-07-15 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (562, CAST(N'2019-07-16 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (563, CAST(N'2019-07-17 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (564, CAST(N'2019-07-18 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (565, CAST(N'2019-07-19 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (566, CAST(N'2019-07-20 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (567, CAST(N'2019-07-21 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (568, CAST(N'2019-07-22 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (569, CAST(N'2019-07-23 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (570, CAST(N'2019-07-24 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (571, CAST(N'2019-07-25 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (572, CAST(N'2019-07-26 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (573, CAST(N'2019-07-27 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (574, CAST(N'2019-07-28 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (575, CAST(N'2019-07-29 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (576, CAST(N'2019-07-30 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (577, CAST(N'2019-07-31 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (578, CAST(N'2019-08-01 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (579, CAST(N'2019-08-02 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (580, CAST(N'2019-08-03 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (581, CAST(N'2019-08-04 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (582, CAST(N'2019-08-05 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (583, CAST(N'2019-08-06 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (584, CAST(N'2019-08-07 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (585, CAST(N'2019-08-08 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (586, CAST(N'2019-08-09 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (587, CAST(N'2019-08-10 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (588, CAST(N'2019-08-11 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (589, CAST(N'2019-08-12 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (590, CAST(N'2019-08-13 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (591, CAST(N'2019-08-14 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (592, CAST(N'2019-08-15 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (593, CAST(N'2019-08-16 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (594, CAST(N'2019-08-17 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (595, CAST(N'2019-08-18 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (596, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (597, CAST(N'2019-08-20 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (598, CAST(N'2019-08-21 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (599, CAST(N'2019-08-22 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (600, CAST(N'2019-08-23 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (601, CAST(N'2019-08-24 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (602, CAST(N'2019-08-25 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (603, CAST(N'2019-08-26 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (604, CAST(N'2019-08-27 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (605, CAST(N'2019-08-28 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (606, CAST(N'2019-08-29 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (607, CAST(N'2019-08-30 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (608, CAST(N'2019-08-31 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (609, CAST(N'2019-09-01 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (610, CAST(N'2019-09-02 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (611, CAST(N'2019-09-03 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (612, CAST(N'2019-09-04 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (613, CAST(N'2019-09-05 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (614, CAST(N'2019-09-06 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (615, CAST(N'2019-09-07 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (616, CAST(N'2019-09-08 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (617, CAST(N'2019-09-09 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (618, CAST(N'2019-09-10 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (619, CAST(N'2019-09-11 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (620, CAST(N'2019-09-12 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (621, CAST(N'2019-09-13 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (622, CAST(N'2019-09-14 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (623, CAST(N'2019-09-15 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (624, CAST(N'2019-09-16 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (625, CAST(N'2019-09-17 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (626, CAST(N'2019-09-18 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (627, CAST(N'2019-09-19 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (628, CAST(N'2019-09-20 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (629, CAST(N'2019-09-21 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (630, CAST(N'2019-09-22 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (631, CAST(N'2019-09-23 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (632, CAST(N'2019-09-24 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (633, CAST(N'2019-09-25 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (634, CAST(N'2019-09-26 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (635, CAST(N'2019-09-27 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (636, CAST(N'2019-09-28 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (637, CAST(N'2019-09-29 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (638, CAST(N'2019-09-30 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (639, CAST(N'2019-10-01 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (640, CAST(N'2019-10-02 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (641, CAST(N'2019-10-03 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (642, CAST(N'2019-10-04 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (643, CAST(N'2019-10-05 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (644, CAST(N'2019-10-06 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (645, CAST(N'2019-10-07 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (646, CAST(N'2019-10-08 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (647, CAST(N'2019-10-09 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (648, CAST(N'2019-10-10 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (649, CAST(N'2019-10-11 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (650, CAST(N'2019-10-12 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (651, CAST(N'2019-10-13 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (652, CAST(N'2019-10-14 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (653, CAST(N'2019-10-15 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (654, CAST(N'2019-10-16 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (655, CAST(N'2019-10-17 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (656, CAST(N'2019-10-18 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (657, CAST(N'2019-10-19 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (658, CAST(N'2019-10-20 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (659, CAST(N'2019-10-21 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (660, CAST(N'2019-10-22 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (661, CAST(N'2019-10-23 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (662, CAST(N'2019-10-24 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (663, CAST(N'2019-10-25 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (664, CAST(N'2019-10-26 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (665, CAST(N'2019-10-27 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (666, CAST(N'2019-10-28 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (667, CAST(N'2019-10-29 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (668, CAST(N'2019-10-30 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (669, CAST(N'2019-10-31 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (670, CAST(N'2019-11-01 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (671, CAST(N'2019-11-02 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (672, CAST(N'2019-11-03 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (673, CAST(N'2019-11-04 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (674, CAST(N'2019-11-05 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (675, CAST(N'2019-11-06 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (676, CAST(N'2019-11-07 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (677, CAST(N'2019-11-08 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (678, CAST(N'2019-11-09 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (679, CAST(N'2019-11-10 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (680, CAST(N'2019-11-11 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (681, CAST(N'2019-11-12 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (682, CAST(N'2019-11-13 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (683, CAST(N'2019-11-14 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (684, CAST(N'2019-11-15 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (685, CAST(N'2019-11-16 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (686, CAST(N'2019-11-17 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (687, CAST(N'2019-11-18 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (688, CAST(N'2019-11-19 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (689, CAST(N'2019-11-20 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (690, CAST(N'2019-11-21 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (691, CAST(N'2019-11-22 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (692, CAST(N'2019-11-23 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (693, CAST(N'2019-11-24 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (694, CAST(N'2019-11-25 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (695, CAST(N'2019-11-26 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (696, CAST(N'2019-11-27 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (697, CAST(N'2019-11-28 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (698, CAST(N'2019-11-29 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (699, CAST(N'2019-11-30 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (700, CAST(N'2019-12-01 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (701, CAST(N'2019-12-02 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (702, CAST(N'2019-12-03 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (703, CAST(N'2019-12-04 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (704, CAST(N'2019-12-05 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (705, CAST(N'2019-12-06 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (706, CAST(N'2019-12-07 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (707, CAST(N'2019-12-08 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (708, CAST(N'2019-12-09 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (709, CAST(N'2019-12-10 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (710, CAST(N'2019-12-11 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (711, CAST(N'2019-12-12 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (712, CAST(N'2019-12-13 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (713, CAST(N'2019-12-14 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (714, CAST(N'2019-12-15 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (715, CAST(N'2019-12-16 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (716, CAST(N'2019-12-17 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (717, CAST(N'2019-12-18 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (718, CAST(N'2019-12-19 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (719, CAST(N'2019-12-20 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (720, CAST(N'2019-12-21 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (721, CAST(N'2019-12-22 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (722, CAST(N'2019-12-23 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (723, CAST(N'2019-12-24 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (724, CAST(N'2019-12-25 00:00:00.000' AS DateTime), N'Wednesday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (725, CAST(N'2019-12-26 00:00:00.000' AS DateTime), N'Thursday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (726, CAST(N'2019-12-27 00:00:00.000' AS DateTime), N'Friday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (727, CAST(N'2019-12-28 00:00:00.000' AS DateTime), N'Saturday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (728, CAST(N'2019-12-29 00:00:00.000' AS DateTime), N'Sunday', N'SUNDAY', N'Weekly Off', 1)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (729, CAST(N'2019-12-30 00:00:00.000' AS DateTime), N'Monday', N'', N'', 0)
GO
INSERT [dbo].[smsCalendars] ([CalendarID], [Date], [DayName], [Title], [Description], [IsHoliday]) VALUES (730, CAST(N'2019-12-31 00:00:00.000' AS DateTime), N'Tuesday', N'', N'', 0)
GO
SET IDENTITY_INSERT [dbo].[smsCalendars] OFF
GO
SET IDENTITY_INSERT [dbo].[smsChapters] ON 

GO
INSERT [dbo].[smsChapters] ([ChapterID], [Name], [SubjectID]) VALUES (1, N'Demo chapter english class1', 1)
GO
INSERT [dbo].[smsChapters] ([ChapterID], [Name], [SubjectID]) VALUES (2, N'Demo chapter maths class1', 2)
GO
INSERT [dbo].[smsChapters] ([ChapterID], [Name], [SubjectID]) VALUES (3, N'Demo chapter english class2', 3)
GO
INSERT [dbo].[smsChapters] ([ChapterID], [Name], [SubjectID]) VALUES (4, N'Demo chapter physics class1', 4)
GO
SET IDENTITY_INSERT [dbo].[smsChapters] OFF
GO
SET IDENTITY_INSERT [dbo].[smsChequeStatuses] ON 

GO
INSERT [dbo].[smsChequeStatuses] ([ChequeStatusID], [Name]) VALUES (1, N'RECEIVED')
GO
INSERT [dbo].[smsChequeStatuses] ([ChequeStatusID], [Name]) VALUES (2, N'DEPOSITED')
GO
INSERT [dbo].[smsChequeStatuses] ([ChequeStatusID], [Name]) VALUES (3, N'DISHONOURED')
GO
INSERT [dbo].[smsChequeStatuses] ([ChequeStatusID], [Name]) VALUES (4, N'REPLACED CHEQUE')
GO
INSERT [dbo].[smsChequeStatuses] ([ChequeStatusID], [Name]) VALUES (5, N'REPLACED CASH')
GO
INSERT [dbo].[smsChequeStatuses] ([ChequeStatusID], [Name]) VALUES (6, N'REALISED')
GO
INSERT [dbo].[smsChequeStatuses] ([ChequeStatusID], [Name]) VALUES (7, N'CANCELLED')
GO
SET IDENTITY_INSERT [dbo].[smsChequeStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[smsCities] ON 

GO
INSERT [dbo].[smsCities] ([CityID], [Name], [CityCode]) VALUES (1, N'HYDERABAD', N'HYD')
GO
SET IDENTITY_INSERT [dbo].[smsCities] OFF
GO
SET IDENTITY_INSERT [dbo].[smsClasses] ON 

GO
INSERT [dbo].[smsClasses] ([ClassID], [Name]) VALUES (1, N'Class 1')
GO
INSERT [dbo].[smsClasses] ([ClassID], [Name]) VALUES (2, N'Class 2')
GO
SET IDENTITY_INSERT [dbo].[smsClasses] OFF
GO
SET IDENTITY_INSERT [dbo].[smsCompanies] ON 

GO
INSERT [dbo].[smsCompanies] ([CompanyID], [Name], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Email], [Website], [RegNo], [CurrencyID], [DefaultLanguage], [Logo]) VALUES (1, N'DEMO COMPANY', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, N'+91 1111 111 111', NULL, NULL, NULL, 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[smsCompanies] OFF
GO
SET IDENTITY_INSERT [dbo].[smsCompanyAcademicYears] ON 

GO
INSERT [dbo].[smsCompanyAcademicYears] ([CompanyAcademicYearID], [CompanyID], [AcademicYearID]) VALUES (1, 1, 1)
GO
INSERT [dbo].[smsCompanyAcademicYears] ([CompanyAcademicYearID], [CompanyID], [AcademicYearID]) VALUES (2, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[smsCompanyAcademicYears] OFF
GO
SET IDENTITY_INSERT [dbo].[smsCountries] ON 

GO
INSERT [dbo].[smsCountries] ([CountryID], [Name], [CountryCode], [Nationality]) VALUES (1, N'INDIA', N'IND', N'INDIAN')
GO
SET IDENTITY_INSERT [dbo].[smsCountries] OFF
GO
SET IDENTITY_INSERT [dbo].[smsCurrencies] ON 

GO
INSERT [dbo].[smsCurrencies] ([CurrencyID], [Name], [CountryID], [Symbol], [NoOfDecimals], [MonetaryUnit], [StatusBaseCurrency], [ExchangeRate]) VALUES (1, N'INDIAN', 1, N'IND', 2, N'', 1, CAST(70.50 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[smsCurrencies] OFF
GO
SET IDENTITY_INSERT [dbo].[smsDayBooks] ON 

GO
INSERT [dbo].[smsDayBooks] ([DayBookID], [Col1], [Col2], [Col3], [Col4], [Col5], [Col6], [Col7], [Col8], [Col9]) VALUES (1, N'Voucher No', N'Particulars', N'Credit Acc', N'Debit Acc', N'Credit Amt', N'Debit Amt', N'1-November-2018', N'30-November-2018', N'<b>DEMO COMPANY</b><br/>Address:      HYDERABAD INDIA <br/>Email:  , Mobile: +91 1111 111 111')
GO
INSERT [dbo].[smsDayBooks] ([DayBookID], [Col1], [Col2], [Col3], [Col4], [Col5], [Col6], [Col7], [Col8], [Col9]) VALUES (2, N'30-November-2018', N'', N'', N'', N'', N'', N'', N'', N'')
GO
INSERT [dbo].[smsDayBooks] ([DayBookID], [Col1], [Col2], [Col3], [Col4], [Col5], [Col6], [Col7], [Col8], [Col9]) VALUES (3, N'EM EMDSTEA000002-2', N'Employee Salary: Demo Employee 1, Detail: December Salary, salary Debit', NULL, N'BANK ACCOUNT', N'0.00', N'20,000.00', N'', N'', N'')
GO
INSERT [dbo].[smsDayBooks] ([DayBookID], [Col1], [Col2], [Col3], [Col4], [Col5], [Col6], [Col7], [Col8], [Col9]) VALUES (4, N'EM EMDSTEA000002-2', N'Employee Salary: Demo Employee 1, Detail: December Salary, salary credit', N'CASH ACCOUNT MAIN', NULL, N'20,000.00', N'0.00', N'', N'', N'')
GO
INSERT [dbo].[smsDayBooks] ([DayBookID], [Col1], [Col2], [Col3], [Col4], [Col5], [Col6], [Col7], [Col8], [Col9]) VALUES (5, N'ST STDSSTU000008-1', N'Student Fee: Master Student Eight, Detail: December Fees Pais, fee Debit', NULL, N'BANK ACCOUNT', N'0.00', N'16,666.67', N'', N'', N'')
GO
INSERT [dbo].[smsDayBooks] ([DayBookID], [Col1], [Col2], [Col3], [Col4], [Col5], [Col6], [Col7], [Col8], [Col9]) VALUES (6, N'ST STDSSTU000008-1', N'Student Fee: Master Student Eight, Detail: December Fees Pais, fee credit', N'CASH ACCOUNT MAIN', NULL, N'16,666.67', N'0.00', N'', N'', N'')
GO
INSERT [dbo].[smsDayBooks] ([DayBookID], [Col1], [Col2], [Col3], [Col4], [Col5], [Col6], [Col7], [Col8], [Col9]) VALUES (7, N'EM EMDSTEA000001-1', N'Teacher Salary: Mr Teacher One, Detail: December Salary paid, salary Debit', NULL, N'BANK ACCOUNT', N'0.00', N'10,000.00', N'', N'', N'')
GO
INSERT [dbo].[smsDayBooks] ([DayBookID], [Col1], [Col2], [Col3], [Col4], [Col5], [Col6], [Col7], [Col8], [Col9]) VALUES (8, N'EM EMDSTEA000001-1', N'Teacher Salary: Mr Teacher One, Detail: December Salary paid, salary credit', N'CASH ACCOUNT MAIN', NULL, N'10,000.00', N'0.00', N'', N'', N'')
GO
INSERT [dbo].[smsDayBooks] ([DayBookID], [Col1], [Col2], [Col3], [Col4], [Col5], [Col6], [Col7], [Col8], [Col9]) VALUES (9, N'', N'', N'', N'DAY TOTAL', N'46,666.67', N'46,666.67', N'', N'', N'')
GO
INSERT [dbo].[smsDayBooks] ([DayBookID], [Col1], [Col2], [Col3], [Col4], [Col5], [Col6], [Col7], [Col8], [Col9]) VALUES (10, N'', N'', N'', N'GRAND TOTAL', N'46,666.67', N'46,666.67', N'', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[smsDayBooks] OFF
GO
SET IDENTITY_INSERT [dbo].[smsDebitCredits] ON 

GO
INSERT [dbo].[smsDebitCredits] ([DebitCreditID], [Name]) VALUES (1, N'DEBIT')
GO
INSERT [dbo].[smsDebitCredits] ([DebitCreditID], [Name]) VALUES (2, N'CREDIT')
GO
SET IDENTITY_INSERT [dbo].[smsDebitCredits] OFF
GO
SET IDENTITY_INSERT [dbo].[smsDiscountTypes] ON 

GO
INSERT [dbo].[smsDiscountTypes] ([DiscountTypeID], [Name]) VALUES (1, N'AMOUNT')
GO
INSERT [dbo].[smsDiscountTypes] ([DiscountTypeID], [Name]) VALUES (2, N'PERCENTAGE')
GO
SET IDENTITY_INSERT [dbo].[smsDiscountTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[smsEmployees] ON 

GO
INSERT [dbo].[smsEmployees] ([EmployeeID], [Name], [IdCard], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Photo], [SchoolID], [UserID], [LeavesToAvail], [Salary], [Status]) VALUES (1, N'SUPER ADMIN', N'ADMIN1', N'', N'', N'', N'', N'', 1, 1, N'', N'', N'', N'/Uploads/2b036114-74d3-4070-b1e3-7127d66c6baa.jpg', 1, 1, 0, CAST(0.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[smsEmployees] ([EmployeeID], [Name], [IdCard], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Photo], [SchoolID], [UserID], [LeavesToAvail], [Salary], [Status]) VALUES (2, N'Demo Employee 1', N'DSTEA000002', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, 21, 10, CAST(20000.00 AS Decimal(18, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[smsEmployees] OFF
GO
SET IDENTITY_INSERT [dbo].[smsExamPortions] ON 

GO
INSERT [dbo].[smsExamPortions] ([ExamPortionID], [ExamID], [ChapterID], [TopicID]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[smsExamPortions] ([ExamPortionID], [ExamID], [ChapterID], [TopicID]) VALUES (2, 2, 2, 4)
GO
INSERT [dbo].[smsExamPortions] ([ExamPortionID], [ExamID], [ChapterID], [TopicID]) VALUES (3, 3, 3, 7)
GO
SET IDENTITY_INSERT [dbo].[smsExamPortions] OFF
GO
SET IDENTITY_INSERT [dbo].[smsExams] ON 

GO
INSERT [dbo].[smsExams] ([ExamID], [Name], [SchoolID], [SubjectID], [Date], [Remarks]) VALUES (1, N'Half yearly Class 1 English', 1, 1, CAST(N'2018-11-01 00:00:00.000' AS DateTime), N'demo')
GO
INSERT [dbo].[smsExams] ([ExamID], [Name], [SchoolID], [SubjectID], [Date], [Remarks]) VALUES (2, N'Half yearly Class 1 Maths', 1, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), N'Demo')
GO
INSERT [dbo].[smsExams] ([ExamID], [Name], [SchoolID], [SubjectID], [Date], [Remarks]) VALUES (3, N'Half Yearly Class 2 English', 1, 3, CAST(N'2018-11-01 00:00:00.000' AS DateTime), N'Demo')
GO
SET IDENTITY_INSERT [dbo].[smsExams] OFF
GO
SET IDENTITY_INSERT [dbo].[smsExceptionLoggers] ON 

GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (1, N'Unexpected "foreach" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "foreach" with "@".
', N'TimeTable', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-16 14:11:28.297' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (2, N'Unexpected "foreach" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "foreach" with "@".
', N'TimeTable', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-16 14:12:48.427' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (3, N'Unexpected "foreach" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "foreach" with "@".
', N'TimeTable', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-16 14:13:54.293' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (4, N'Unexpected "foreach" keyword after "@" character.  Once inside code, you do not need to prefix constructs like "foreach" with "@".
', N'TimeTable', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-16 14:14:33.273' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (5, N'C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\Student\Index.cshtml(20): error CS0103: The name ''roleid'' does not exist in the current context', N'Student', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-17 17:39:39.160' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (6, N'C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\Student\Index.cshtml(71): error CS1002: ; expected', N'Student', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-17 17:41:31.717' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (7, N'Object reference not set to an instance of an object.', N'StudentAttendance', N'   at learnersmate.Controllers.StudentAttendanceController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\StudentAttendanceController.cs:line 158
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-17 18:06:20.630' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (8, N'Object reference not set to an instance of an object.', N'StudentAttendance', N'   at learnersmate.Controllers.StudentAttendanceController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\StudentAttendanceController.cs:line 158
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-17 18:10:10.023' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (9, N'C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\videos\index.cshtml(71): error CS1061: ''Video'' does not contain a definition for ''EmployeeID'' and no extension method ''EmployeeID'' accepting a first argument of type ''Video'' could be found (are you missing a using directive or an assembly reference?)', N'videos', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-17 19:59:08.013' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (10, N'Object reference not set to an instance of an object.', N'Videos', N'   at ASP._Page_Views_videos_Create_cshtml.Execute() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\videos\Create.cshtml:line 28
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-17 19:59:53.957' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (11, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:21:46.797' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (12, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:21:57.053' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (13, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:22:03.993' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (14, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:23:35.853' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (15, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:25:33.960' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (16, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:29:56.943' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (17, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:30:12.783' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (18, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:30:51.350' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (19, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:31:34.877' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (20, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:32:23.220' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (21, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:33:34.863' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (22, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:34:00.590' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (23, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:35:56.283' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (24, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:36:43.950' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (25, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:38:09.227' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (26, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:39:10.820' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (27, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:41:15.473' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (28, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:42:16.027' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (29, N'Maximum request length exceeded.', N'Company', N'   at System.Web.HttpRequest.GetEntireRawContent()
   at System.Web.HttpRequest.GetMultipartContent()
   at System.Web.HttpRequest.FillInFormCollection()
   at System.Web.HttpRequest.EnsureForm()
   at System.Web.HttpRequest.get_Form()
   at System.Web.HttpRequestWrapper.get_Form()
   at System.Web.UI.PageRequestManager.IsAsyncPostBackRequest(HttpRequestBase request)
   at System.Web.Handlers.ScriptModule.HttpResponse_Redirecting(Object sender, EventArgs e)
   at System.Web.HttpResponse.Redirect(String url, Boolean endResponse, Boolean permanent)
   at System.Web.HttpResponseWrapper.Redirect(String url, Boolean endResponse)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 07:45:04.480' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (30, N'Execution of authentication request returned unexpected result: 404', N'Video', N'   at Google.GData.Client.Utilities.getAuthException(TokenCollection tokens, HttpWebResponse response)
   at Google.GData.Client.Utilities.QueryClientLoginToken(GDataCredentials gc, String serviceName, String applicationName, Boolean fUseKeepAlive, IWebProxy proxyServer, Uri clientLoginHandler)
   at Google.GData.Client.GDataGAuthRequest.QueryAuthToken(GDataCredentials gc)
   at Google.GData.Client.GDataGAuthRequest.EnsureCredentials()
   at Google.GData.Client.GDataRequest.EnsureWebRequest()
   at Google.GData.Client.GDataGAuthRequest.EnsureWebRequest()
   at Google.GData.Client.GDataGAuthRequest.CopyRequestData()
   at Google.GData.Client.GDataGAuthRequest.Execute(Int32 retryCounter)
   at Google.GData.Client.GDataGAuthRequest.Execute()
   at Google.GData.Client.MediaService.EntrySend(Uri feedUri, AtomBase baseEntry, GDataRequestType type, AsyncSendData data)
   at Google.GData.Client.Service.Insert(Uri feedUri, AtomEntry newEntry, AsyncSendData data)
   at Google.GData.Client.Service.Insert[TEntry](Uri feedUri, TEntry entry)
   at Google.GData.YouTube.YouTubeService.Upload(String userName, YouTubeEntry entry)
   at Google.YouTube.YouTubeRequest.Upload(String userName, Video v)
   at Google.YouTube.YouTubeRequest.Upload(Video v)
   at learnersmate.Controllers.VideoController.Create(Video video, HttpPostedFileBase uploadvideo, String newlogo, Boolean IsYoutube) in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\VideoController.cs:line 116
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 09:03:25.177' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (31, N'An error occurred while executing the command definition. See the inner exception for details.', N'Video', N'   at System.Data.Entity.Core.EntityClient.Internal.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)
   at System.Data.Entity.Core.Objects.Internal.ObjectQueryExecutionPlan.Execute[TResultType](ObjectContext context, ObjectParameterCollection parameterValues)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at learnersmate.Controllers.VideoController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\VideoController.cs:line 39
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 10:32:08.470' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (32, N'C:\Users\bhaskhard\AppData\Local\Temp\Temporary ASP.NET Files\vs\08d5f869\ea813e32\App_Web_index.cshtml.1a284548.hsfmbt-d.0.cs(31): error CS0246: The type or namespace name ''tenantsoft'' could not be found (are you missing a using directive or an assembly reference?)', N'PurchaseInvoice', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 11:32:49.883' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (33, N'The layout page "~/Views/Shared/_LayoutMasters.cshtml" could not be found at the following path: "~/Views/Shared/_LayoutMasters.cshtml".', N'PurchaseInvoice', N'   at System.Web.WebPages.WebPageExecutingBase.NormalizeLayoutPagePath(String layoutPagePath)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 11:35:32.457' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (34, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult EditAccountHeadAssign(System.Collections.Generic.List`1[learnersmate.Models.tempAcHeadAssigns], Int32)'' in ''learnersmate.Controllers.AccountHeadAssignController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'AccountHeadAssign', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 12:51:41.693' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (35, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult EditAccountHeadAssign(System.Collections.Generic.List`1[learnersmate.Models.tempAcHeadAssigns], Int32)'' in ''learnersmate.Controllers.AccountHeadAssignController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'AccountHeadAssign', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 12:51:44.050' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (36, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult EditAccountHeadAssign(System.Collections.Generic.List`1[learnersmate.Models.tempAcHeadAssigns], Int32)'' in ''learnersmate.Controllers.AccountHeadAssignController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'AccountHeadAssign', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 12:51:52.457' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (37, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult EditAccountHeadAssign(System.Collections.Generic.List`1[learnersmate.Models.tempAcHeadAssigns], Int32)'' in ''learnersmate.Controllers.AccountHeadAssignController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'AccountHeadAssign', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 12:53:24.127' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (38, N'Object reference not set to an instance of an object.', N'Student', N'   at learnersmate.Controllers.StudentController.Edit(Nullable`1 id) in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\StudentController.cs:line 251
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-18 20:32:57.420' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (39, N'Child actions are not allowed to perform redirect actions.', N'TaskList', N'   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 17:11:40.913' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (40, N'Child actions are not allowed to perform redirect actions.', N'TaskList', N'   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 17:11:45.240' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (41, N'Child actions are not allowed to perform redirect actions.', N'TaskList', N'   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 17:12:58.143' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (42, N'Child actions are not allowed to perform redirect actions.', N'TaskList', N'   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 17:13:10.990' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (43, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:33:00.887' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (44, N'Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'Notification', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Notification_Index_cshtml.Execute() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\Notification\Index.cshtml:line 10
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:33:29.940' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (45, N'Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'Notification', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName)
   at ASP._Page_Views_Notification_Index_cshtml.Execute() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\Notification\Index.cshtml:line 10
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:33:43.687' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (46, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:35:50.540' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (47, N'Cannot convert type ''string'' to ''System.Web.Mvc.MultiSelectList''', N'Notification', N'   at CallSite.Target(Closure , CallSite , Object )
   at System.Dynamic.UpdateDelegates.UpdateAndExecute1[T0,TRet](CallSite site, T0 arg0)
   at ASP._Page_Views_Notification_Create_cshtml.Execute() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\Notification\Create.cshtml:line 42
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:36:20.320' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (48, N'Cannot convert type ''string'' to ''System.Web.Mvc.MultiSelectList''', N'Notification', N'   at CallSite.Target(Closure , CallSite , Object )
   at System.Dynamic.UpdateDelegates.UpdateAndExecute1[T0,TRet](CallSite site, T0 arg0)
   at ASP._Page_Views_Notification_Create_cshtml.Execute() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\Notification\Create.cshtml:line 42
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:37:25.790' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (49, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:38:40.767' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (50, N'C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\Notification\Create.cshtml(41): error CS1973: ''HtmlHelper<Notification>'' has no applicable method named ''Label'' but appears to have an extension method by that name. Extension methods cannot be dynamically dispatched. Consider casting the dynamic arguments or calling the extension method without the extension method syntax.', N'Notification', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:44:45.410' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (51, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:57:03.090' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (52, N'The parameters dictionary contains a null entry for parameter ''notifytoid'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Create(learnersmate.Models.Notification, System.String[], Int32)'' in ''learnersmate.Controllers.NotificationController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'Notification', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:57:20.360' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (53, N'The parameters dictionary contains a null entry for parameter ''notifytoid'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Create(learnersmate.Models.Notification, System.String[], Int32)'' in ''learnersmate.Controllers.NotificationController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'Notification', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:58:01.137' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (54, N'The parameters dictionary contains a null entry for parameter ''notifytoid'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Create(learnersmate.Models.Notification, System.String[], Int32)'' in ''learnersmate.Controllers.NotificationController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'Notification', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:58:10.843' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (55, N'The parameters dictionary contains a null entry for parameter ''notifytoid'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Create(learnersmate.Models.Notification, System.String[], Int32)'' in ''learnersmate.Controllers.NotificationController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'Notification', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:58:18.997' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (56, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 19:59:28.523' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (57, N'There is no ViewData item of type ''IEnumerable<SelectListItem>'' that has the key ''NotifyID''.', N'Notification', N'   at System.Web.Mvc.Html.SelectExtensions.GetSelectData(HtmlHelper htmlHelper, String name)
   at System.Web.Mvc.Html.SelectExtensions.SelectInternal(HtmlHelper htmlHelper, ModelMetadata metadata, String optionLabel, String name, IEnumerable`1 selectList, Boolean allowMultiple, IDictionary`2 htmlAttributes)
   at System.Web.Mvc.Html.SelectExtensions.DropDownList(HtmlHelper htmlHelper, String name, IEnumerable`1 selectList, String optionLabel, Object htmlAttributes)
   at ASP._Page_Views_Notification_Create_cshtml.Execute() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\Notification\Create.cshtml:line 45
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:00:03.870' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (58, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:08:54.150' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (59, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:09:48.300' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (60, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:35:55.380' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (61, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult DeleteConfirm(Int32)'' in ''learnersmate.Controllers.NotificationController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'Notification', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:36:58.593' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (62, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult DeleteConfirm(Int32)'' in ''learnersmate.Controllers.NotificationController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'Notification', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:37:57.417' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (63, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult DeleteConfirm(Int32)'' in ''learnersmate.Controllers.NotificationController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'Notification', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:38:33.040' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (64, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult DeleteConfirm(Int32)'' in ''learnersmate.Controllers.NotificationController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'Notification', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:39:07.200' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (65, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:40:44.133' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (66, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:43:26.563' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (67, N'Object reference not set to an instance of an object.', N'Notification', N'   at learnersmate.Controllers.NotificationController.Index() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Controllers\NotificationController.cs:line 27
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:49:06.127' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (68, N'Object reference not set to an instance of an object.', N'Notification', N'   at ASP._Page_Views_Notification_Edit_cshtml.Execute() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\Notification\Edit.cshtml:line 5
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 20:49:37.533' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (69, N'C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\NotificationSchool\Index.cshtml(55): error CS0103: The name ''notifyid'' does not exist in the current context', N'NotificationSchool', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 21:15:04.953' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (70, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Create(Int32)'' in ''learnersmate.Controllers.NotificationSchoolController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'NotificationSchool', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 21:15:35.030' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (71, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Create(Int32)'' in ''learnersmate.Controllers.NotificationSchoolController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'NotificationSchool', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 21:16:14.697' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (72, N'Error executing child request for handler ''System.Web.Mvc.HttpHandlerUtil+ServerExecuteHttpHandlerAsyncWrapper''.', N'NotificationSchool', N'   at System.Web.HttpServerUtility.ExecuteInternal(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage, VirtualPath path, VirtualPath filePath, String physPath, Exception error, String queryStringOverride)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm, Boolean setPreviousPage)
   at System.Web.HttpServerUtility.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.HttpServerUtilityWrapper.Execute(IHttpHandler handler, TextWriter writer, Boolean preserveForm)
   at System.Web.Mvc.Html.ChildActionExtensions.ActionHelper(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues, TextWriter textWriter)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, RouteValueDictionary routeValues)
   at System.Web.Mvc.Html.ChildActionExtensions.Action(HtmlHelper htmlHelper, String actionName, String controllerName, Object routeValues)
   at ASP._Page_Views_NotificationSchool_Index_cshtml.Execute() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\NotificationSchool\Index.cshtml:line 63
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 21:36:53.913' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (73, N'C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\NotificationSchool\ListFor.cshtml(7): error CS1061: ''NotificationSchool'' does not contain a definition for ''Name'' and no extension method ''Name'' accepting a first argument of type ''NotificationSchool'' could be found (are you missing a using directive or an assembly reference?)', N'NotificationSchool', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 21:37:08.000' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (74, N'C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\NotificationSchool\ListFor.cshtml(7): error CS1061: ''NotificationSchool'' does not contain a definition for ''Name'' and no extension method ''Name'' accepting a first argument of type ''NotificationSchool'' could be found (are you missing a using directive or an assembly reference?)', N'NotificationSchool', N'   at System.Web.Compilation.BuildManager.PostProcessFoundBuildResult(BuildResult result, Boolean keyFromVPP, VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetBuildResultFromCacheInternal(String cacheKey, Boolean keyFromVPP, VirtualPath virtualPath, Int64 hashCode, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultFromCacheInternal(VirtualPath virtualPath, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 21:37:16.513' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (75, N'C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\NotificationSchool\ListFor.cshtml(7): error CS1061: ''NotificationSchool'' does not contain a definition for ''Name'' and no extension method ''Name'' accepting a first argument of type ''NotificationSchool'' could be found (are you missing a using directive or an assembly reference?)', N'NotificationSchool', N'   at System.Web.Compilation.BuildManager.PostProcessFoundBuildResult(BuildResult result, Boolean keyFromVPP, VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetBuildResultFromCacheInternal(String cacheKey, Boolean keyFromVPP, VirtualPath virtualPath, Int64 hashCode, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultFromCacheInternal(VirtualPath virtualPath, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 21:37:16.540' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (76, N'C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\NotificationSchool\ListFor.cshtml(7): error CS1061: ''NotificationSchool'' does not contain a definition for ''Name'' and no extension method ''Name'' accepting a first argument of type ''NotificationSchool'' could be found (are you missing a using directive or an assembly reference?)', N'NotificationSchool', N'   at System.Web.Compilation.BuildManager.PostProcessFoundBuildResult(BuildResult result, Boolean keyFromVPP, VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetBuildResultFromCacheInternal(String cacheKey, Boolean keyFromVPP, VirtualPath virtualPath, Int64 hashCode, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultFromCacheInternal(VirtualPath virtualPath, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-19 21:37:16.563' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (77, N'There is no ViewData item of type ''IEnumerable<SelectListItem>'' that has the key ''TeacherIDID''.', N'StudentAssignment', N'   at System.Web.Mvc.Html.SelectExtensions.GetSelectData(HtmlHelper htmlHelper, String name)
   at System.Web.Mvc.Html.SelectExtensions.SelectInternal(HtmlHelper htmlHelper, ModelMetadata metadata, String optionLabel, String name, IEnumerable`1 selectList, Boolean allowMultiple, IDictionary`2 htmlAttributes)
   at System.Web.Mvc.Html.SelectExtensions.DropDownList(HtmlHelper htmlHelper, String name, IEnumerable`1 selectList, String optionLabel, Object htmlAttributes)
   at ASP._Page_Views_StudentAssignment_Edit_cshtml.Execute() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\StudentAssignment\Edit.cshtml:line 31
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 13:06:22.233' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (78, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult IndexSubmission(Int32)'' in ''learnersmate.Controllers.StudentAssignmentController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'StudentAssignment', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 13:12:02.833' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (79, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult IndexSubmission(Int32)'' in ''learnersmate.Controllers.StudentAssignmentController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'StudentAssignment', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 13:12:14.520' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (80, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult IndexSubmission(Int32)'' in ''learnersmate.Controllers.StudentAssignmentController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'StudentAssignment', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 13:12:25.950' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (81, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.JsonResult GetSubjectByClass(Int32)'' in ''learnersmate.Controllers.SubjectController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'Subject', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 18:05:26.630' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (82, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.JsonResult GetSubjectByClass(Int32)'' in ''learnersmate.Controllers.SubjectController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'Subject', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 18:05:29.237' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (83, N'DataBinding: ''System.Web.Mvc.SelectListItem'' does not contain a property with the name ''SubjectID''.', N'StudentAssignment', N'   at System.Web.UI.DataBinder.GetPropertyValue(Object container, String propName)
   at System.Web.UI.DataBinder.Eval(Object container, String[] expressionParts)
   at System.Web.UI.DataBinder.Eval(Object container, String expression)
   at System.Web.Mvc.MultiSelectList.Eval(Object container, String expression)
   at System.Web.Mvc.MultiSelectList.<>c__DisplayClass2.<GetListItemsWithValueField>b__1(Object item)
   at System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at System.Web.Mvc.MultiSelectList.GetListItemsWithValueField()
   at System.Web.Mvc.MultiSelectList.GetListItems()
   at System.Web.Mvc.MultiSelectList.GetEnumerator()
   at System.Web.Mvc.Html.SelectExtensions.GetSelectListWithDefaultValue(IEnumerable`1 selectList, Object defaultValue, Boolean allowMultiple)
   at System.Web.Mvc.Html.SelectExtensions.SelectInternal(HtmlHelper htmlHelper, ModelMetadata metadata, String optionLabel, String name, IEnumerable`1 selectList, Boolean allowMultiple, IDictionary`2 htmlAttributes)
   at System.Web.Mvc.Html.SelectExtensions.DropDownListFor[TModel,TProperty](HtmlHelper`1 htmlHelper, Expression`1 expression, IEnumerable`1 selectList, String optionLabel, IDictionary`2 htmlAttributes)
   at System.Web.Mvc.Html.SelectExtensions.DropDownListFor[TModel,TProperty](HtmlHelper`1 htmlHelper, Expression`1 expression, IEnumerable`1 selectList, String optionLabel, Object htmlAttributes)
   at ASP._Page_Views_StudentAssignment_Create_cshtml.Execute() in C:\Users\bhaskhard\Downloads\dlearnersmate\learnersmate\Views\StudentAssignment\Create.cshtml:line 82
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 18:12:36.863' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (84, N'The parameters dictionary contains a null entry for parameter ''existing'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult EditSubmit(learnersmate.Models.StudentAssignmentSubmission, Int32)'' in ''learnersmate.Controllers.StudentAssignmentController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'StudentAssignment', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 18:55:25.153' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (85, N'The parameters dictionary contains a null entry for parameter ''existing'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult EditSubmit(learnersmate.Models.StudentAssignmentSubmission, Int32)'' in ''learnersmate.Controllers.StudentAssignmentController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'StudentAssignment', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 18:55:49.887' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (86, N'The parameters dictionary contains a null entry for parameter ''existing'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult EditSubmit(learnersmate.Models.StudentAssignmentSubmission, Int32)'' in ''learnersmate.Controllers.StudentAssignmentController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'StudentAssignment', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 18:56:10.760' AS DateTime))
GO
INSERT [dbo].[smsExceptionLoggers] ([ExceptionLoggerID], [ExceptionMessage], [ControllerName], [ExceptionStackTrace], [LogTime]) VALUES (87, N'The parameters dictionary contains a null entry for parameter ''existing'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult EditSubmit(learnersmate.Models.StudentAssignmentSubmission, Int32)'' in ''learnersmate.Controllers.StudentAssignmentController''. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters', N'StudentAssignment', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<BeginInvokeSynchronousActionMethod>b__39(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3d()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass46.<InvokeActionMethodFilterAsynchronouslyRecursive>b__3f()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass33.<BeginInvokeActionMethodWithFilters>b__32(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<>c__DisplayClass2b.<BeginInvokeAction>b__1c()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass21.<BeginInvokeAction>b__1e(IAsyncResult asyncResult)', CAST(N'2018-11-20 18:57:37.570' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsExceptionLoggers] OFF
GO
SET IDENTITY_INSERT [dbo].[smsFeeBook] ON 

GO
INSERT [dbo].[smsFeeBook] ([FeeBookID], [StudentID], [Title], [Amount], [Dop]) VALUES (1, 8, N'December Fee Received - 1nd Instalment', CAST(16666.67 AS Decimal(18, 2)), CAST(N'2018-11-30 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsFeeBook] OFF
GO
SET IDENTITY_INSERT [dbo].[smsMainMenu] ON 

GO
INSERT [dbo].[smsMainMenu] ([MainMenuID], [MainMenuName], [MainMenuName2], [MainMenuOrder]) VALUES (10, N'CREATE & MAINTAIN', N'?????', 0)
GO
INSERT [dbo].[smsMainMenu] ([MainMenuID], [MainMenuName], [MainMenuName2], [MainMenuOrder]) VALUES (50, N'MAINTENANCE', N'??????', 0)
GO
INSERT [dbo].[smsMainMenu] ([MainMenuID], [MainMenuName], [MainMenuName2], [MainMenuOrder]) VALUES (250, N'CREATE & MAINTAIN', N'??????', 0)
GO
INSERT [dbo].[smsMainMenu] ([MainMenuID], [MainMenuName], [MainMenuName2], [MainMenuOrder]) VALUES (300, N'TRANSACTION', N'?????', 0)
GO
INSERT [dbo].[smsMainMenu] ([MainMenuID], [MainMenuName], [MainMenuName2], [MainMenuOrder]) VALUES (350, N'CREATE & MAINTAIN', N'??????', 0)
GO
INSERT [dbo].[smsMainMenu] ([MainMenuID], [MainMenuName], [MainMenuName2], [MainMenuOrder]) VALUES (400, N'CREATE & MAINTAIN', N'??????', 0)
GO
INSERT [dbo].[smsMainMenu] ([MainMenuID], [MainMenuName], [MainMenuName2], [MainMenuOrder]) VALUES (450, N'CREATE & MAINTAIN', N'??????', 0)
GO
INSERT [dbo].[smsMainMenu] ([MainMenuID], [MainMenuName], [MainMenuName2], [MainMenuOrder]) VALUES (500, N'CREATE & MAINTAIN', N'??????', 0)
GO
SET IDENTITY_INSERT [dbo].[smsMainMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[smsNotificationEmployees] ON 

GO
INSERT [dbo].[smsNotificationEmployees] ([NotificationEmployeeID], [NotificationID], [EmployeeID]) VALUES (1, 6, 2)
GO
SET IDENTITY_INSERT [dbo].[smsNotificationEmployees] OFF
GO
SET IDENTITY_INSERT [dbo].[smsNotificationParents] ON 

GO
INSERT [dbo].[smsNotificationParents] ([NotificationParentID], [NotificationID], [ParentID]) VALUES (1, 3, 1)
GO
INSERT [dbo].[smsNotificationParents] ([NotificationParentID], [NotificationID], [ParentID]) VALUES (2, 4, 2)
GO
SET IDENTITY_INSERT [dbo].[smsNotificationParents] OFF
GO
SET IDENTITY_INSERT [dbo].[smsNotifications] ON 

GO
INSERT [dbo].[smsNotifications] ([NotificationID], [NotificationTypeID], [Name], [Detail], [NotifiedDate]) VALUES (1, 1, N'Demo Notification one', N'Aadasd asd asdsdas dad asd asd das dasd asd asd asd asd ad ad ad asdasdasdas dasd asd asda sdas dasd', CAST(N'2018-11-20 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsNotifications] ([NotificationID], [NotificationTypeID], [Name], [Detail], [NotifiedDate]) VALUES (2, 2, N'Demo Notification two', N'Aadasd asd asdsdas dad asd asd das dasd asd asd asd asd ad ad ad asdasdasdas dasd asd asda sdas dasd', CAST(N'2018-11-20 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsNotifications] ([NotificationID], [NotificationTypeID], [Name], [Detail], [NotifiedDate]) VALUES (3, 3, N'Demo Notification three', N'Aadasd asd asdsdas dad asd asd das dasd asd asd asd asd ad ad ad asdasdasdas dasd asd asda sdas dasd', CAST(N'2018-11-20 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsNotifications] ([NotificationID], [NotificationTypeID], [Name], [Detail], [NotifiedDate]) VALUES (4, 3, N'Demo Notification four', N'Aadasd asd asdsdas dad asd asd das dasd asd asd asd asd ad ad ad asdasdasdas dasd asd asda sdas dasd', CAST(N'2018-11-02 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsNotifications] ([NotificationID], [NotificationTypeID], [Name], [Detail], [NotifiedDate]) VALUES (5, 4, N'Demo Notification five', N'Aadasd asd asdsdas dad asd asd das dasd asd asd asd asd ad ad ad asdasdasdas dasd asd asda sdas dasd', CAST(N'2018-11-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsNotifications] ([NotificationID], [NotificationTypeID], [Name], [Detail], [NotifiedDate]) VALUES (6, 5, N'Demo Notification six', N'Aadasd asd asdsdas dad asd asd das dasd asd asd asd asd ad ad ad asdasdasdas dasd asd asda sdas dasd', CAST(N'2018-11-15 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsNotifications] OFF
GO
SET IDENTITY_INSERT [dbo].[smsNotificationSchools] ON 

GO
INSERT [dbo].[smsNotificationSchools] ([NotificationSchoolID], [NotificationID], [SchoolID]) VALUES (5, 1, 2)
GO
INSERT [dbo].[smsNotificationSchools] ([NotificationSchoolID], [NotificationID], [SchoolID]) VALUES (6, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[smsNotificationSchools] OFF
GO
SET IDENTITY_INSERT [dbo].[smsNotificationStudents] ON 

GO
INSERT [dbo].[smsNotificationStudents] ([NotificationStudentID], [NotificationID], [StudentID]) VALUES (1, 5, 3)
GO
SET IDENTITY_INSERT [dbo].[smsNotificationStudents] OFF
GO
SET IDENTITY_INSERT [dbo].[smsNotificationTeachers] ON 

GO
INSERT [dbo].[smsNotificationTeachers] ([NotificationTeacherID], [NotificationID], [TeacherID]) VALUES (2, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[smsNotificationTeachers] OFF
GO
SET IDENTITY_INSERT [dbo].[smsNotificationTypes] ON 

GO
INSERT [dbo].[smsNotificationTypes] ([NotificationTypeID], [Name]) VALUES (1, N'School Notification')
GO
INSERT [dbo].[smsNotificationTypes] ([NotificationTypeID], [Name]) VALUES (2, N'Teacher Notification')
GO
INSERT [dbo].[smsNotificationTypes] ([NotificationTypeID], [Name]) VALUES (3, N'Parent Notification')
GO
INSERT [dbo].[smsNotificationTypes] ([NotificationTypeID], [Name]) VALUES (4, N'Student Notification')
GO
INSERT [dbo].[smsNotificationTypes] ([NotificationTypeID], [Name]) VALUES (5, N'Employee Notification')
GO
SET IDENTITY_INSERT [dbo].[smsNotificationTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[smsParents] ON 

GO
INSERT [dbo].[smsParents] ([ParentID], [Name], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Photo], [SchoolID], [UserID], [Status]) VALUES (1, N'Mr Parent One', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, 7, 1)
GO
INSERT [dbo].[smsParents] ([ParentID], [Name], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Photo], [SchoolID], [UserID], [Status]) VALUES (2, N'Mr Parent Two', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, 8, 1)
GO
INSERT [dbo].[smsParents] ([ParentID], [Name], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Photo], [SchoolID], [UserID], [Status]) VALUES (3, N'Mr Parent Three', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, 9, 1)
GO
SET IDENTITY_INSERT [dbo].[smsParents] OFF
GO
SET IDENTITY_INSERT [dbo].[smsPeriods] ON 

GO
INSERT [dbo].[smsPeriods] ([PeriodID], [Name], [Time]) VALUES (1, N'1. Period 1', N'9AM to 10 AM')
GO
INSERT [dbo].[smsPeriods] ([PeriodID], [Name], [Time]) VALUES (2, N'2. Period 2', N'10AM to 11AM')
GO
INSERT [dbo].[smsPeriods] ([PeriodID], [Name], [Time]) VALUES (3, N'3. Period 3', N'11AM to 12PM')
GO
INSERT [dbo].[smsPeriods] ([PeriodID], [Name], [Time]) VALUES (4, N'4. Period 4', N'12PM to 1PM')
GO
INSERT [dbo].[smsPeriods] ([PeriodID], [Name], [Time]) VALUES (5, N'5. Lunch', N'1PM to 2PM')
GO
INSERT [dbo].[smsPeriods] ([PeriodID], [Name], [Time]) VALUES (6, N'6. Period 5', N'2PM to 3PM')
GO
INSERT [dbo].[smsPeriods] ([PeriodID], [Name], [Time]) VALUES (7, N'7. Period 6', N'3PM to 4PM')
GO
INSERT [dbo].[smsPeriods] ([PeriodID], [Name], [Time]) VALUES (8, N'8. Sports', N'4PM to 4.30PM')
GO
SET IDENTITY_INSERT [dbo].[smsPeriods] OFF
GO
SET IDENTITY_INSERT [dbo].[smsPurchaseInvoiceDetails] ON 

GO
INSERT [dbo].[smsPurchaseInvoiceDetails] ([PurchaseInvoiceDetailID], [Description], [PurchaseInvoiceID], [Quantity], [PurchaseInvoiceDetailUnit], [Rate], [RateFC], [DetailValue], [DetailValueFC], [Tax], [NetValue], [AccountHeadID], [DetailJob], [ProductsServices], [Flag]) VALUES (1, N'222', 1, 22, 2, CAST(22.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(484.00 AS Decimal(18, 2)), CAST(484.00 AS Decimal(18, 2)), 0, CAST(484.00 AS Decimal(18, 2)), 1, N'2', N'yy', 0)
GO
INSERT [dbo].[smsPurchaseInvoiceDetails] ([PurchaseInvoiceDetailID], [Description], [PurchaseInvoiceID], [Quantity], [PurchaseInvoiceDetailUnit], [Rate], [RateFC], [DetailValue], [DetailValueFC], [Tax], [NetValue], [AccountHeadID], [DetailJob], [ProductsServices], [Flag]) VALUES (2, N'-', 2, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), 1, N'', N'', 0)
GO
SET IDENTITY_INSERT [dbo].[smsPurchaseInvoiceDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[smsPurchaseInvoices] ON 

GO
INSERT [dbo].[smsPurchaseInvoices] ([PurchaseInvoiceID], [InvoiceNo], [InvoiceDate], [SupplierID], [ExternalReference], [QuotationNoDate], [LPONoDate], [CurrencyID], [EmployeeID], [GrossTotalAmount], [DiscountTypeID], [Discount], [VatAmount], [NetTotalAmount], [Remarks], [Flag]) VALUES (1, N'PI-000001', CAST(N'2018-11-18 00:00:00.000' AS DateTime), 0, NULL, NULL, NULL, 1, 2, CAST(484.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(484.00 AS Decimal(18, 2)), NULL, 1)
GO
INSERT [dbo].[smsPurchaseInvoices] ([PurchaseInvoiceID], [InvoiceNo], [InvoiceDate], [SupplierID], [ExternalReference], [QuotationNoDate], [LPONoDate], [CurrencyID], [EmployeeID], [GrossTotalAmount], [DiscountTypeID], [Discount], [VatAmount], [NetTotalAmount], [Remarks], [Flag]) VALUES (2, N'PI-000002', CAST(N'2018-11-18 00:00:00.000' AS DateTime), 0, NULL, NULL, NULL, 1, 2, CAST(0.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[smsPurchaseInvoices] OFF
GO
SET IDENTITY_INSERT [dbo].[smsRevenueTypes] ON 

GO
INSERT [dbo].[smsRevenueTypes] ([RevenueTypeID], [Name]) VALUES (1, N'Rent Revenue')
GO
INSERT [dbo].[smsRevenueTypes] ([RevenueTypeID], [Name]) VALUES (2, N'Commission Revenue')
GO
INSERT [dbo].[smsRevenueTypes] ([RevenueTypeID], [Name]) VALUES (3, N'Security Deposit')
GO
INSERT [dbo].[smsRevenueTypes] ([RevenueTypeID], [Name]) VALUES (4, N'Utility Deposit')
GO
SET IDENTITY_INSERT [dbo].[smsRevenueTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[smsRoles] ON 

GO
INSERT [dbo].[smsRoles] ([RoleID], [Name]) VALUES (1, N'SuperAdmin')
GO
INSERT [dbo].[smsRoles] ([RoleID], [Name]) VALUES (2, N'SchoolAdmin')
GO
INSERT [dbo].[smsRoles] ([RoleID], [Name]) VALUES (3, N'Teacher')
GO
INSERT [dbo].[smsRoles] ([RoleID], [Name]) VALUES (4, N'Parent')
GO
INSERT [dbo].[smsRoles] ([RoleID], [Name]) VALUES (5, N'Student')
GO
INSERT [dbo].[smsRoles] ([RoleID], [Name]) VALUES (6, N'Employee')
GO
SET IDENTITY_INSERT [dbo].[smsRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[smsSalaryBookEmployee] ON 

GO
INSERT [dbo].[smsSalaryBookEmployee] ([SalaryBookID], [EmployeeID], [Title], [Amount], [Dop]) VALUES (2, 2, N'December Salary', CAST(20000.00 AS Decimal(18, 2)), CAST(N'2018-11-30 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsSalaryBookEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[smsSalaryBookTeacher] ON 

GO
INSERT [dbo].[smsSalaryBookTeacher] ([SalaryBookID], [TeacherID], [Title], [Amount], [Dop]) VALUES (1, 1, N'December Salary paid', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2018-11-30 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsSalaryBookTeacher] OFF
GO
SET IDENTITY_INSERT [dbo].[smsSchools] ON 

GO
INSERT [dbo].[smsSchools] ([SchoolID], [Name], [ShortName], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Website], [RegNo], [Logo], [Principal], [UserID], [CompanyAcademicYearID], [Status]) VALUES (1, N'Demo School', N'DS', N'Demo Address', N'Demo BuildingName', N'Demo Street', N'Demo Area', N'Demo Location', 1, 1, N'00000', N'040 000 000 0000', N'333 333 3333', N'Demo Website.com', N'', N'/Uploads/2b036114-74d3-4070-b1e3-7127d66c6baa.jpg', N'Mr Demo', 1, 1, 1)
GO
INSERT [dbo].[smsSchools] ([SchoolID], [Name], [ShortName], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Website], [RegNo], [Logo], [Principal], [UserID], [CompanyAcademicYearID], [Status]) VALUES (2, N'Demo School Two', N'DS2', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'Mr Demo Two', 2, 1, 1)
GO
INSERT [dbo].[smsSchools] ([SchoolID], [Name], [ShortName], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Website], [RegNo], [Logo], [Principal], [UserID], [CompanyAcademicYearID], [Status]) VALUES (3, N'Demo School Three', N'DS3', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'Mr Demo Three', 3, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[smsSchools] OFF
GO
SET IDENTITY_INSERT [dbo].[smsSections] ON 

GO
INSERT [dbo].[smsSections] ([SectionID], [Name]) VALUES (1, N'Section A')
GO
INSERT [dbo].[smsSections] ([SectionID], [Name]) VALUES (2, N'Section B')
GO
SET IDENTITY_INSERT [dbo].[smsSections] OFF
GO
SET IDENTITY_INSERT [dbo].[smsStudentAssignments] ON 

GO
INSERT [dbo].[smsStudentAssignments] ([StudentAssignmentID], [TeacherID], [ClassID], [SectionID], [SubjectID], [Title], [Detail], [AssignedDate], [EndDate]) VALUES (1, 1, 1, 1, 2, N'Demo Assignment one', N'Demo demo', CAST(N'2018-11-02 00:00:00.000' AS DateTime), CAST(N'2018-11-30 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsStudentAssignments] ([StudentAssignmentID], [TeacherID], [ClassID], [SectionID], [SubjectID], [Title], [Detail], [AssignedDate], [EndDate]) VALUES (2, 2, 2, 1, 4, N'Demo Assignment Two', N'Demo demo', CAST(N'2018-11-02 00:00:00.000' AS DateTime), CAST(N'2018-11-29 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsStudentAssignments] ([StudentAssignmentID], [TeacherID], [ClassID], [SectionID], [SubjectID], [Title], [Detail], [AssignedDate], [EndDate]) VALUES (3, 3, 1, 2, 1, N'Demo Assignment Three', N'Demo demo', CAST(N'2018-11-03 00:00:00.000' AS DateTime), CAST(N'2018-11-30 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsStudentAssignments] ([StudentAssignmentID], [TeacherID], [ClassID], [SectionID], [SubjectID], [Title], [Detail], [AssignedDate], [EndDate]) VALUES (4, 3, 2, 2, 4, N'Demo Assignment Four', N'Demo demo', CAST(N'2018-11-04 00:00:00.000' AS DateTime), CAST(N'2018-11-24 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsStudentAssignments] OFF
GO
SET IDENTITY_INSERT [dbo].[smsStudentAssignmentSubmissions] ON 

GO
INSERT [dbo].[smsStudentAssignmentSubmissions] ([StudentAssignmentSubmissionID], [StudentAssignmentID], [StudentID], [Remarks], [SubmittedDate]) VALUES (1, 1, 2, N'Submitted asignment', CAST(N'2018-11-20 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsStudentAssignmentSubmissions] ([StudentAssignmentSubmissionID], [StudentAssignmentID], [StudentID], [Remarks], [SubmittedDate]) VALUES (2, 1, 3, N'Submitted asignment', CAST(N'2018-11-20 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsStudentAssignmentSubmissions] ([StudentAssignmentSubmissionID], [StudentAssignmentID], [StudentID], [Remarks], [SubmittedDate]) VALUES (3, 1, 1, N'Submitted asignment', CAST(N'2018-11-20 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsStudentAssignmentSubmissions] ([StudentAssignmentSubmissionID], [StudentAssignmentID], [StudentID], [Remarks], [SubmittedDate]) VALUES (4, 4, 10, N'Submitted asignment', CAST(N'2018-11-20 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[smsStudentAssignmentSubmissions] ([StudentAssignmentSubmissionID], [StudentAssignmentID], [StudentID], [Remarks], [SubmittedDate]) VALUES (5, 4, 11, N'Submitted asignment', CAST(N'2018-11-20 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsStudentAssignmentSubmissions] OFF
GO
SET IDENTITY_INSERT [dbo].[smsStudentAttendances] ON 

GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (1, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:04:47.390' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (2, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:04:47.457' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (3, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:04:47.463' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (4, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:04:47.467' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (5, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:04:47.470' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (6, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:04:47.477' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (7, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:04:47.477' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (8, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:04:47.483' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (9, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:04:47.487' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (10, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:04:47.490' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (11, 2, CAST(N'2018-11-16 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:04:47.493' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (12, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:15:16.557' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (13, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:15:16.597' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (14, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:15:16.600' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (15, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:15:16.603' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (16, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:15:16.607' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (17, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:15:16.623' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (18, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:15:16.627' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (19, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:15:16.630' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (20, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:15:16.633' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (21, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:15:16.640' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (22, 2, CAST(N'2018-11-17 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:15:16.643' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (23, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:15:16.847' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (24, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:15:16.853' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (25, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:15:16.857' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (26, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:15:16.860' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (27, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:15:16.867' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (28, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:15:16.870' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (29, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:15:16.877' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (30, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:15:16.883' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (31, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:15:16.900' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (32, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:15:16.910' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (33, 2, CAST(N'2018-11-15 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:15:16.913' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (34, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:15:16.923' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (35, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:15:16.927' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (36, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:15:16.933' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (37, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:15:16.937' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (38, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:15:16.940' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (39, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:15:16.947' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (40, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:15:16.953' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (41, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:15:16.957' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (42, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:15:16.960' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (43, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:15:16.967' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (44, 2, CAST(N'2018-11-14 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:15:16.970' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (45, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:15:16.980' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (46, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:15:16.983' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (47, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:15:16.987' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (48, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:15:16.993' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (49, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:15:17.000' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (50, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:15:17.007' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (51, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:15:17.013' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (52, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:15:17.017' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (53, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:15:17.020' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (54, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:15:17.027' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (55, 2, CAST(N'2018-11-13 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:15:17.030' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (56, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:15:17.047' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (57, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:15:17.053' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (58, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:15:17.057' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (59, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:15:17.063' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (60, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:15:17.070' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (61, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:15:17.073' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (62, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:15:17.080' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (63, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:15:17.110' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (64, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:15:17.117' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (65, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:15:17.120' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (66, 2, CAST(N'2018-11-12 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:15:17.123' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (67, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:15:17.133' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (68, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:15:17.137' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (69, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:15:17.140' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (70, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:15:17.147' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (71, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:15:17.150' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (72, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:15:17.157' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (73, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:15:17.160' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (74, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:15:17.167' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (75, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:15:17.170' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (76, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:15:17.177' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (77, 2, CAST(N'2018-11-10 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:15:17.180' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (78, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:20:27.557' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (79, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:20:27.573' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (80, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:20:27.597' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (81, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:20:27.627' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (82, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:20:27.637' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (83, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:20:27.650' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (84, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:20:27.670' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (85, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:20:27.680' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (86, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:20:27.700' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (87, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:20:27.747' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (88, 2, CAST(N'2018-11-02 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:20:27.773' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (89, 2, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:20:27.790' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (90, 2, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:20:27.820' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (91, 1, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:20:27.827' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (92, 2, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:20:27.840' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (93, 2, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:20:27.847' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (94, 2, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:20:27.850' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (95, 2, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:20:27.857' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (96, 2, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:20:27.860' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (97, 2, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:20:27.863' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (98, 2, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:20:27.870' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (99, 2, CAST(N'2018-11-01 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:20:27.877' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (100, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:20:27.887' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (101, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:20:27.893' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (102, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:20:27.897' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (103, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:20:27.900' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (104, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:20:27.907' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (105, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:20:27.913' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (106, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:20:27.917' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (107, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:20:27.923' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (108, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:20:27.927' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (109, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:20:27.930' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (110, 2, CAST(N'2018-10-31 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:20:27.953' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (111, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:20:27.960' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (112, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:20:27.967' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (113, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:20:27.973' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (114, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:20:27.977' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (115, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:20:27.980' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (116, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:20:27.990' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (117, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:20:27.993' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (118, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:20:28.000' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (119, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:20:28.003' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (120, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:20:28.013' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (121, 2, CAST(N'2018-10-30 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:20:28.017' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (122, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:20:28.027' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (123, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:20:28.030' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (124, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:20:28.037' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (125, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:20:28.040' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (126, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:20:28.047' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (127, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:20:28.050' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (128, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:20:28.063' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (129, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:20:28.070' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (130, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:20:28.080' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (131, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:20:28.087' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (132, 2, CAST(N'2018-10-29 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:20:28.090' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (133, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:20:28.097' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (134, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:20:28.100' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (135, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:20:28.103' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (136, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:20:28.120' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (137, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:20:28.123' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (138, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:20:28.127' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (139, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:20:28.130' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (140, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:20:28.137' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (141, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:20:28.140' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (142, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:20:28.143' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (143, 2, CAST(N'2018-10-27 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:20:28.147' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (144, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:20:28.167' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (145, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:20:28.173' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (146, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:20:28.193' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (147, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:20:28.210' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (148, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:20:28.217' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (149, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:20:28.220' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (150, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:20:28.227' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (151, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:20:28.230' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (152, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:20:28.237' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (153, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:20:28.243' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (154, 2, CAST(N'2018-10-26 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:20:28.250' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (155, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 1, N'DSSTU000001', 1, CAST(N'2018-11-17 18:44:47.803' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (156, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 2, N'DSSTU000002', 1, CAST(N'2018-11-17 18:44:47.817' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (157, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 3, N'DSSTU000003', 1, CAST(N'2018-11-17 18:44:47.823' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (158, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 4, N'DSSTU000004', 1, CAST(N'2018-11-17 18:44:47.830' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (159, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 5, N'DSSTU000005', 1, CAST(N'2018-11-17 18:44:47.837' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (160, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 6, N'DSSTU000006', 1, CAST(N'2018-11-17 18:44:47.840' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (161, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 7, N'DSSTU000007', 1, CAST(N'2018-11-17 18:44:47.877' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (162, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 8, N'DSSTU000008', 1, CAST(N'2018-11-17 18:44:47.880' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (163, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 9, N'DSSTU000009', 1, CAST(N'2018-11-17 18:44:47.887' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (164, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 10, N'DSSTU000010', 1, CAST(N'2018-11-17 18:44:47.890' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[smsStudentAttendances] ([StudentAttendanceID], [AttendanceTypeID], [AttendanceDate], [StudentID], [IdCard], [UserID], [UpdatedDate], [Percentage]) VALUES (165, 2, CAST(N'2018-10-25 00:00:00.000' AS DateTime), 11, N'DSSTU000011', 1, CAST(N'2018-11-17 18:44:47.893' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[smsStudentAttendances] OFF
GO
SET IDENTITY_INSERT [dbo].[smsStudents] ON 

GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (1, N'Master Student One', N'DSSTU000001', CAST(N'2018-11-01 00:00:00.000' AS DateTime), NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 10, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (2, N'Master Student Two', N'DSSTU000002', CAST(N'2018-11-01 00:00:00.000' AS DateTime), NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 11, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (3, N'Master Student Three', N'DSSTU000003', CAST(N'2018-11-01 00:00:00.000' AS DateTime), NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 12, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (4, N'Master Student Four 4', N'DSSTU000004', CAST(N'2018-11-01 00:00:00.000' AS DateTime), N'111 111 1111', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'/Uploads/2b036114-74d3-4070-b1e3-7127d66c6baa.jpg', 1, 1, 13, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (5, N'Master Student Five', N'DSSTU000005', CAST(N'2018-11-01 00:00:00.000' AS DateTime), NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 14, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (6, N'Master Student Six', N'DSSTU000006', CAST(N'2018-11-01 00:00:00.000' AS DateTime), NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 15, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (7, N'Master Student Seven', N'DSSTU000007', CAST(N'2018-11-01 00:00:00.000' AS DateTime), NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 16, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (8, N'Master Student Eight', N'DSSTU000008', CAST(N'2018-11-01 00:00:00.000' AS DateTime), NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 17, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (9, N'Master Student Nine', N'DSSTU000009', CAST(N'2018-11-01 00:00:00.000' AS DateTime), NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 18, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (10, N'Master Student Ten', N'DSSTU000010', CAST(N'2018-11-01 00:00:00.000' AS DateTime), NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 19, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
INSERT [dbo].[smsStudents] ([StudentID], [Name], [IdCard], [Dob], [Mobile], [ClassID], [SectionID], [GuardianName], [GuardianMobile], [GuardianEmail], [Parent2Name], [Parent2Mobile], [Parent2Email], [Photo], [SchoolID], [ParentID], [UserID], [Fee], [FeeInstalments], [Status]) VALUES (11, N'Master Student Eleven', N'DSSTU000011', CAST(N'2018-11-01 00:00:00.000' AS DateTime), NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 20, CAST(50000.00 AS Decimal(18, 2)), 3, 1)
GO
SET IDENTITY_INSERT [dbo].[smsStudents] OFF
GO
SET IDENTITY_INSERT [dbo].[smsSubjects] ON 

GO
INSERT [dbo].[smsSubjects] ([SubjectID], [Name], [ClassID]) VALUES (1, N'English', 1)
GO
INSERT [dbo].[smsSubjects] ([SubjectID], [Name], [ClassID]) VALUES (2, N'Maths', 1)
GO
INSERT [dbo].[smsSubjects] ([SubjectID], [Name], [ClassID]) VALUES (3, N'English', 2)
GO
INSERT [dbo].[smsSubjects] ([SubjectID], [Name], [ClassID]) VALUES (4, N'Physics', 2)
GO
SET IDENTITY_INSERT [dbo].[smsSubjects] OFF
GO
SET IDENTITY_INSERT [dbo].[smsSubMenu] ON 

GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (10, N'School', N'?????', N'School', N'Index', 10, N'true,true,false,true,true,false', 1, 10)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (11, N'Teacher', N'?????', N'Teacher', N'Index', 10, N'true,true,false,true,true,false', 1, 11)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (12, N'Parent', N'?????', N'Parent', N'Index', 10, N'true,true,false,true,true,false', 1, 12)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (13, N'Student', N'?????', N'Student', N'Index', 10, N'true,true,false,true,true,false', 1, 13)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (14, N'Time Table', N'?????', N'TimeTable', N'Index', 10, N'true,true,false,true,true,false', 1, 14)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (15, N'Exam', N'?????', N'Exam', N'Index', 10, N'true,true,false,true,true,false', 1, 15)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (16, N'Attendance', N'?????', N'Attendance', N'Index', 10, N'true,true,false,true,true,true', 1, 16)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (17, N'Calendar', N'?????', N'Calendar', N'Index', 10, N'true,true,false,true,true,true', 1, 17)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (18, N'Video', N'?????', N'Video', N'Index', 10, N'true,true,true,true,true,true', 1, 18)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (19, N'Notification', N'?????', N'Notification', N'Index', 10, N'true,true,true,true,true,true', 1, 19)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (20, N'Student Assignment', N'?????', N'StudentAssignment', N'Index', 10, N'true,true,true,false,false,false', 1, 20)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (51, N'Task List Maintenance', N'?????', N'TaskList', N'IndexMaintenance', 50, N'true,true,false,true,true,true', 1, 51)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (52, N'Purchase Invoice', N'?????', N'PurchaseInvoice', N'Index', 50, N'true,true,false,true,true,true', 1, 52)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (250, N'Chart Of Account', N'?????', N'Accounthead', N'Index', 250, N'true,true,true,false,false,false', 1, 250)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (251, N'Account Head Assign', N'?????', N'AccountHeadAssign', N'Index', 250, N'true,true,true,false,false,false', 1, 251)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (252, N'Salary Book', N'?????', N'SalaryBook', N'Index', 250, N'true,true,true,false,false,false', 1, 252)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (253, N'Fee Book', N'?????', N'FeeBook', N'Index', 250, N'true,true,true,false,false,false', 1, 253)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (300, N'Cash Voucher', N'?????', N'CashVoucher', N'Index', 300, N'true,true,true,false,false,false', 1, 300)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (301, N'Bank Voucher', N'?????', N'BankVoucher', N'Index', 300, N'true,true,true,false,false,false', 1, 301)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (302, N'Journal Voucher', N'?????', N'JournalVoucher', N'Index', 300, N'true,true,true,false,false,false', 1, 302)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (303, N'Post Dated Cheques', N'?????', N'PostDatedCheque', N'Index', 300, N'true,true,true,false,false,false', 1, 303)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (350, N'Task List General', N'?????', N'TaskList', N'IndexGeneral', 350, N'true,true,true,true,true,true', 1, 350)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (351, N'Task Manager', N'?????', N'TaskList', N'Index', 350, N'true,true,true,true,true,true', 1, 351)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (400, N'Company', N'?????', N'Company', N'Edit/1', 400, N'true,true,true,true,true,true', 1, 400)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (401, N'Country', N'?????', N'Country', N'Index', 400, N'true,true,true,true,true,true', 1, 401)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (402, N'Currency', N'?????', N'Currency', N'Index', 400, N'true,true,true,true,true,true', 1, 402)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (403, N'City', N'?????', N'City', N'Index', 400, N'true,true,true,true,true,true', 1, 403)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (406, N'Class', N'?????', N'Class', N'Index', 400, N'true,true,true,true,true,true', 1, 406)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (407, N'Section', N'?????', N'Section', N'Index', 400, N'true,true,true,true,true,true', 1, 407)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (408, N'Subject', N'?????', N'Subject', N'Index', 400, N'true,true,true,true,true,true', 1, 408)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (409, N'Chapter', N'?????', N'Chapter', N'Index', 400, N'true,true,true,true,true,true', 1, 409)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (410, N'Topic', N'?????', N'Topic', N'Index', 400, N'true,true,true,true,true,true', 1, 410)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (411, N'Period', N'?????', N'Period', N'Index', 400, N'true,true,true,true,true,true', 1, 411)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (412, N'Holiday', N'?????', N'Holiday', N'Index', 400, N'true,true,true,true,true,true', 1, 412)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (413, N'Bank', N'?????', N'Bank', N'Index', 400, N'true,true,true,true,true,true', 1, 413)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (450, N'Company', N'?????', N'Company', N'Edit/1', 450, N'true,false,false,false,false,false', 1, 450)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (451, N'Menu', N'?????', N'MenuMaintain', N'Index', 450, N'true,false,false,false,false,false', 1, 451)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (452, N'Employee', N'?????', N'Employee', N'Index', 450, N'true,true,true,true,true,true', 1, 452)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (500, N'Day Book', N'?????', N'DayBook', N'Index', 500, N'true,false,false,false,false,false', 1, 500)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (501, N'Cash Book', N'?????', N'CashBook', N'Index', 500, N'true,false,false,false,false,false', 1, 501)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (502, N'Ledger Book', N'?????', N'LedgerBook', N'Index', 500, N'true,false,false,false,false,false', 1, 502)
GO
INSERT [dbo].[smsSubMenu] ([SubMenuID], [SubMenuName], [SubMenuName2], [Controller], [Action], [MainMenuID], [SubMenuRoles], [SubMenuStatus], [SubMenuOrder]) VALUES (503, N'Trial Balance', N'?????', N'TrialBalance', N'Index', 500, N'true,false,false,false,false,false', 1, 503)
GO
SET IDENTITY_INSERT [dbo].[smsSubMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[smsSuppliers] ON 

GO
INSERT [dbo].[smsSuppliers] ([SupplierID], [Name]) VALUES (0, N'Demo Supplier')
GO
SET IDENTITY_INSERT [dbo].[smsSuppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[smsTaskEmployees] ON 

GO
INSERT [dbo].[smsTaskEmployees] ([TaskEmployeeID], [TaskListID], [EmployeeID]) VALUES (3, 2, 2)
GO
INSERT [dbo].[smsTaskEmployees] ([TaskEmployeeID], [TaskListID], [EmployeeID]) VALUES (4, 3, 2)
GO
INSERT [dbo].[smsTaskEmployees] ([TaskEmployeeID], [TaskListID], [EmployeeID]) VALUES (5, 4, 2)
GO
INSERT [dbo].[smsTaskEmployees] ([TaskEmployeeID], [TaskListID], [EmployeeID]) VALUES (6, 5, 2)
GO
INSERT [dbo].[smsTaskEmployees] ([TaskEmployeeID], [TaskListID], [EmployeeID]) VALUES (7, 6, 2)
GO
INSERT [dbo].[smsTaskEmployees] ([TaskEmployeeID], [TaskListID], [EmployeeID]) VALUES (8, 7, 2)
GO
SET IDENTITY_INSERT [dbo].[smsTaskEmployees] OFF
GO
SET IDENTITY_INSERT [dbo].[smsTaskPriorities] ON 

GO
INSERT [dbo].[smsTaskPriorities] ([TaskPriorityID], [Name]) VALUES (1, N'HIGH PRIORITY')
GO
INSERT [dbo].[smsTaskPriorities] ([TaskPriorityID], [Name]) VALUES (2, N'LOW PRIORITY')
GO
INSERT [dbo].[smsTaskPriorities] ([TaskPriorityID], [Name]) VALUES (3, N'CRITICAL')
GO
INSERT [dbo].[smsTaskPriorities] ([TaskPriorityID], [Name]) VALUES (4, N'OPTIONAL')
GO
SET IDENTITY_INSERT [dbo].[smsTaskPriorities] OFF
GO
SET IDENTITY_INSERT [dbo].[smsTaskStatuses] ON 

GO
INSERT [dbo].[smsTaskStatuses] ([TaskStatusID], [Name]) VALUES (1, N'OPEN')
GO
INSERT [dbo].[smsTaskStatuses] ([TaskStatusID], [Name]) VALUES (2, N'HOLD')
GO
INSERT [dbo].[smsTaskStatuses] ([TaskStatusID], [Name]) VALUES (3, N'CLOSE')
GO
SET IDENTITY_INSERT [dbo].[smsTaskStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[smsTaskTaskLists] ON 

GO
INSERT [dbo].[smsTaskTaskLists] ([TaskListID], [Name], [ListDetail], [TaskTypeID], [TaskPriorityID], [TaskStatusID], [ListDate]) VALUES (2, N'Demo Task Two', N'Demo', 1, 2, 1, CAST(N'2018-11-19 17:11:40.883' AS DateTime))
GO
INSERT [dbo].[smsTaskTaskLists] ([TaskListID], [Name], [ListDetail], [TaskTypeID], [TaskPriorityID], [TaskStatusID], [ListDate]) VALUES (3, N'Demo Task Two', N'Demo', 1, 2, 1, CAST(N'2018-11-19 17:11:45.237' AS DateTime))
GO
INSERT [dbo].[smsTaskTaskLists] ([TaskListID], [Name], [ListDetail], [TaskTypeID], [TaskPriorityID], [TaskStatusID], [ListDate]) VALUES (4, N'dasd', N'asdasd', 1, 3, 1, CAST(N'2018-11-19 17:12:52.773' AS DateTime))
GO
INSERT [dbo].[smsTaskTaskLists] ([TaskListID], [Name], [ListDetail], [TaskTypeID], [TaskPriorityID], [TaskStatusID], [ListDate]) VALUES (5, N'dasd', N'asdasd', 1, 3, 1, CAST(N'2018-11-19 17:13:09.260' AS DateTime))
GO
INSERT [dbo].[smsTaskTaskLists] ([TaskListID], [Name], [ListDetail], [TaskTypeID], [TaskPriorityID], [TaskStatusID], [ListDate]) VALUES (6, N'aDAd', N'dasd', 1, 1, 1, CAST(N'2018-11-19 17:18:58.630' AS DateTime))
GO
INSERT [dbo].[smsTaskTaskLists] ([TaskListID], [Name], [ListDetail], [TaskTypeID], [TaskPriorityID], [TaskStatusID], [ListDate]) VALUES (7, N'asfas', N'asfasf', 2, 3, 1, CAST(N'2018-11-19 17:21:37.923' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsTaskTaskLists] OFF
GO
SET IDENTITY_INSERT [dbo].[smsTaskTypes] ON 

GO
INSERT [dbo].[smsTaskTypes] ([TaskTypeID], [Name]) VALUES (1, N'GENERAL')
GO
INSERT [dbo].[smsTaskTypes] ([TaskTypeID], [Name]) VALUES (2, N'MAINTENANCE')
GO
SET IDENTITY_INSERT [dbo].[smsTaskTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[smsTeachers] ON 

GO
INSERT [dbo].[smsTeachers] ([TeacherID], [Name], [IdCard], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Photo], [SchoolID], [UserID], [LeavesToAvail], [Salary], [Status]) VALUES (1, N'Mr Teacher One', N'DSTEA000001', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, 4, 10, CAST(10000.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[smsTeachers] ([TeacherID], [Name], [IdCard], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Photo], [SchoolID], [UserID], [LeavesToAvail], [Salary], [Status]) VALUES (2, N'Mr Teacher Two', N'DSTEA000002', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, 5, 10, CAST(20000.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[smsTeachers] ([TeacherID], [Name], [IdCard], [HouseNo], [BuildingName], [Street], [Area], [Location], [CityID], [CountryID], [PinCode], [Landline], [Mobile], [Photo], [SchoolID], [UserID], [LeavesToAvail], [Salary], [Status]) VALUES (3, N'Mr Teacher Three', N'DSTEA000003', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, 6, 10, CAST(30000.00 AS Decimal(18, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[smsTeachers] OFF
GO
SET IDENTITY_INSERT [dbo].[smsTimeTables] ON 

GO
INSERT [dbo].[smsTimeTables] ([TimeTableID], [SchoolID], [ClassID], [SectionID], [PeriodID], [TeacherID], [SubjectID], [isClassTeacher], [Employee_EmployeeID]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, NULL)
GO
INSERT [dbo].[smsTimeTables] ([TimeTableID], [SchoolID], [ClassID], [SectionID], [PeriodID], [TeacherID], [SubjectID], [isClassTeacher], [Employee_EmployeeID]) VALUES (2, 1, 1, 1, 2, 2, 2, 0, NULL)
GO
INSERT [dbo].[smsTimeTables] ([TimeTableID], [SchoolID], [ClassID], [SectionID], [PeriodID], [TeacherID], [SubjectID], [isClassTeacher], [Employee_EmployeeID]) VALUES (3, 1, 2, 1, 1, 3, 3, 1, NULL)
GO
INSERT [dbo].[smsTimeTables] ([TimeTableID], [SchoolID], [ClassID], [SectionID], [PeriodID], [TeacherID], [SubjectID], [isClassTeacher], [Employee_EmployeeID]) VALUES (4, 1, 2, 2, 2, 2, 4, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[smsTimeTables] OFF
GO
SET IDENTITY_INSERT [dbo].[smsTokens] ON 

GO
INSERT [dbo].[smsTokens] ([TokenID], [TokenKey], [IssuedOn], [ExpiresOn], [CreatedOn], [Email], [Password], [UserID], [RoleID], [SchoolID], [AcademicYearID], [Company], [CompanyLogo]) VALUES (1, N'oxDcyBtfmE1QxeU', CAST(N'2018-11-18 19:51:22.787' AS DateTime), CAST(N'2018-11-20 19:51:22.787' AS DateTime), CAST(N'2018-11-18 19:51:22.787' AS DateTime), N'demo@malusoftindia.com', N'', 1, 1, 1, 1, N'DEMO COMPANY', NULL)
GO
INSERT [dbo].[smsTokens] ([TokenID], [TokenKey], [IssuedOn], [ExpiresOn], [CreatedOn], [Email], [Password], [UserID], [RoleID], [SchoolID], [AcademicYearID], [Company], [CompanyLogo]) VALUES (2, N'cmr8BGC7TX9hUvX', CAST(N'2018-11-18 20:04:35.663' AS DateTime), CAST(N'2018-11-20 20:04:35.663' AS DateTime), CAST(N'2018-11-18 20:04:35.663' AS DateTime), N'demo@malusoftindia.com', N'', 1, 1, 1, 1, N'DEMO COMPANY', NULL)
GO
INSERT [dbo].[smsTokens] ([TokenID], [TokenKey], [IssuedOn], [ExpiresOn], [CreatedOn], [Email], [Password], [UserID], [RoleID], [SchoolID], [AcademicYearID], [Company], [CompanyLogo]) VALUES (3, N'yjhrLd2S6cbjcbP', CAST(N'2018-11-18 20:21:45.460' AS DateTime), CAST(N'2018-11-20 20:21:45.460' AS DateTime), CAST(N'2018-11-18 20:21:45.460' AS DateTime), N'demostudent4@malusoftindia.com', N'', 13, 5, 1, 1, N'DEMO COMPANY', NULL)
GO
INSERT [dbo].[smsTokens] ([TokenID], [TokenKey], [IssuedOn], [ExpiresOn], [CreatedOn], [Email], [Password], [UserID], [RoleID], [SchoolID], [AcademicYearID], [Company], [CompanyLogo]) VALUES (4, N'jWNIeSse3RzyRDI', CAST(N'2018-11-20 21:27:26.087' AS DateTime), CAST(N'2018-11-22 21:27:26.087' AS DateTime), CAST(N'2018-11-20 21:27:26.087' AS DateTime), N'demostudent4@malusoftindia.com', N'', 13, 5, 1, 1, N'DEMO COMPANY', NULL)
GO
SET IDENTITY_INSERT [dbo].[smsTokens] OFF
GO
SET IDENTITY_INSERT [dbo].[smsTopics] ON 

GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (1, N'Demo chapter1 english class1', 1)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (2, N'Demo chapter2 english class1', 1)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (3, N'Demo chapter3 english class1', 1)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (4, N'Demo chapter1 maths class1', 2)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (5, N'Demo chapter2 maths class1', 2)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (6, N'Demo chapter3 maths class1', 2)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (7, N'Demo chapter1 english class2', 3)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (8, N'Demo chapter2 english class2', 3)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (9, N'Demo chapter3 english class2', 3)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (10, N'Demo chapter1 physics class2', 4)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (11, N'Demo chapter2 physics class2', 4)
GO
INSERT [dbo].[smsTopics] ([TopicID], [Name], [ChapterID]) VALUES (12, N'Demo chapter3 physics class2', 4)
GO
SET IDENTITY_INSERT [dbo].[smsTopics] OFF
GO
SET IDENTITY_INSERT [dbo].[smsTransactionTypes] ON 

GO
INSERT [dbo].[smsTransactionTypes] ([TransactionTypeID], [Name]) VALUES (1, N'CASH')
GO
INSERT [dbo].[smsTransactionTypes] ([TransactionTypeID], [Name]) VALUES (2, N'BANK')
GO
INSERT [dbo].[smsTransactionTypes] ([TransactionTypeID], [Name]) VALUES (3, N'CREDIT CARD')
GO
INSERT [dbo].[smsTransactionTypes] ([TransactionTypeID], [Name]) VALUES (4, N'BANK TRANSFER')
GO
INSERT [dbo].[smsTransactionTypes] ([TransactionTypeID], [Name]) VALUES (5, N'BANK DEPOSIT')
GO
SET IDENTITY_INSERT [dbo].[smsTransactionTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[smsUserPagePermissions] ON 

GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (1, 1, N'Account Head Assign', N'AccountHeadAssign', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (2, 1, N'Chart Of Account', N'Accounthead', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (3, 1, N'Attendance', N'Attendance', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (4, 1, N'Bank', N'Bank', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (5, 1, N'Bank Voucher', N'BankVoucher', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (6, 1, N'Calendar', N'Calendar', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (7, 1, N'Cash Book', N'CashBook', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (8, 1, N'Cash Voucher', N'CashVoucher', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (9, 1, N'Chapter', N'Chapter', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (10, 1, N'City', N'City', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (11, 1, N'Class', N'Class', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (12, 1, N'Company', N'Company', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (13, 1, N'Country', N'Country', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (14, 1, N'Currency', N'Currency', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (15, 1, N'Day Book', N'DayBook', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (16, 1, N'Employee', N'Employee', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (17, 1, N'Exam', N'Exam', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (18, 1, N'FeeBook', N'FeeBook', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (19, 1, N'Holiday', N'Holiday', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (20, 1, N'Journal Voucher', N'JournalVoucher', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (21, 1, N'Ledger Book', N'LedgerBook', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (22, 1, N'Menu Maintain', N'MenuMaintain', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (23, 1, N'Notification', N'Notification', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (24, 1, N'Parent', N'Parent', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (25, 1, N'Period', N'Period', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (26, 1, N'Post Dated Cheque', N'PostDatedCheque', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (27, 1, N'Purchase Invoice', N'PurchaseInvoice', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (28, 1, N'Salary Book', N'SalaryBook', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (29, 1, N'School', N'School', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (30, 1, N'Section', N'Section', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (31, 1, N'Student', N'Student', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (32, 1, N'Student Assignment', N'StudentAssignment', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (33, 1, N'Subject', N'Subject', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (34, 1, N'TaskList', N'TaskList', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (35, 1, N'Teacher', N'Teacher', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (36, 1, N'Time Table', N'TimeTable', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (37, 1, N'Topic', N'Topic', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (38, 1, N'Trial Balance', N'TrialBalance', 1, 1, 1, 1, 1)
GO
INSERT [dbo].[smsUserPagePermissions] ([UserPagePermissionID], [UserID], [PageName], [PageUrl], [CanView], [CanCreate], [CanEdit], [CanDelete], [CanPrint]) VALUES (39, 1, N'Video', N'Video', 1, 1, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[smsUserPagePermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[smsUserPageViews] ON 

GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (1, 1, N'/dashboard', CAST(N'2018-11-18 10:45:39.243' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (2, 1, N'/Video/Index', CAST(N'2018-11-18 10:45:41.777' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (3, 1, N'/Video/Create', CAST(N'2018-11-18 10:45:43.643' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (4, 1, N'/dashboard', CAST(N'2018-11-18 10:47:17.053' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (5, 1, N'/Video/Index', CAST(N'2018-11-18 10:47:19.207' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (6, 1, N'/Video/Create', CAST(N'2018-11-18 10:47:20.600' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (7, 1, N'/Video/Index', CAST(N'2018-11-18 10:47:26.953' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (8, 1, N'/Video/Edit/1', CAST(N'2018-11-18 10:47:29.227' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (9, 1, N'/dashboard', CAST(N'2018-11-18 10:49:32.490' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (10, 1, N'/Video/Index', CAST(N'2018-11-18 10:49:35.467' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (11, 1, N'/Video/Edit/1', CAST(N'2018-11-18 10:49:37.617' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (12, 1, N'/Video/Index', CAST(N'2018-11-18 10:49:40.630' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (13, 1, N'/Video/Edit/1', CAST(N'2018-11-18 10:49:43.070' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (14, 1, N'/Video/Index', CAST(N'2018-11-18 10:49:52.797' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (15, 1, N'/Video/Details/1', CAST(N'2018-11-18 10:49:56.070' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (16, 1, N'/Video/Details/1', CAST(N'2018-11-18 10:50:26.170' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (17, 1, N'/Video/Index', CAST(N'2018-11-18 10:50:37.133' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (18, 1, N'/Video/Edit/1', CAST(N'2018-11-18 10:50:38.473' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (19, 1, N'/Video/Index', CAST(N'2018-11-18 10:50:45.623' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (20, 1, N'/Video/Details/1', CAST(N'2018-11-18 10:50:48.357' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (21, 1, N'/Video/Index', CAST(N'2018-11-18 10:52:09.253' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (22, 1, N'/Video/Details/1', CAST(N'2018-11-18 10:52:12.000' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (23, 1, N'/Video/Details/1', CAST(N'2018-11-18 10:52:56.093' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (24, 1, N'/Video/Index', CAST(N'2018-11-18 10:52:58.983' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (25, 1, N'/Video/Details/1', CAST(N'2018-11-18 10:53:02.000' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (26, 1, N'/Video/Index', CAST(N'2018-11-18 10:53:04.643' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (27, 1, N'/Video/Create', CAST(N'2018-11-18 10:53:08.617' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (28, 1, N'/Video/Index', CAST(N'2018-11-18 10:53:23.390' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (29, 1, N'/Video/Details/2', CAST(N'2018-11-18 10:53:26.817' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (30, 1, N'/Video/Index', CAST(N'2018-11-18 10:53:29.350' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (31, 1, N'/Video/Create', CAST(N'2018-11-18 10:53:31.537' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (32, 1, N'/Video/Index', CAST(N'2018-11-18 10:53:52.407' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (33, 1, N'/Video/Edit/3', CAST(N'2018-11-18 10:53:55.510' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (34, 1, N'/Video/Index', CAST(N'2018-11-18 10:53:57.210' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (35, 1, N'/Video/Details/3', CAST(N'2018-11-18 10:53:58.737' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (36, 1, N'/Video/Index', CAST(N'2018-11-18 10:54:01.210' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (37, 1, N'/Video/Edit/3', CAST(N'2018-11-18 10:54:03.660' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (38, 1, N'/Video/Index', CAST(N'2018-11-18 10:54:27.877' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (39, 1, N'/Video/Details/3', CAST(N'2018-11-18 10:54:31.477' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (40, 1, N'/Video/Index', CAST(N'2018-11-18 10:54:32.857' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (41, 1, N'/Video/Details/2', CAST(N'2018-11-18 10:54:34.223' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (42, 1, N'/Video/Index', CAST(N'2018-11-18 10:54:36.183' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (43, 1, N'/Video/Details/1', CAST(N'2018-11-18 10:54:37.317' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (44, 1, N'/Video/Index', CAST(N'2018-11-18 10:54:39.240' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (45, 1, N'/Video/Details/3', CAST(N'2018-11-18 10:54:40.727' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (46, 1, N'/Video/Index', CAST(N'2018-11-18 10:54:42.920' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (47, 1, N'/Video/Details/2', CAST(N'2018-11-18 10:59:43.367' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (48, 1, N'/Video/Details/2', CAST(N'2018-11-18 11:01:32.827' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (49, 1, N'/Video/Index', CAST(N'2018-11-18 11:01:36.147' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (50, 1, N'/Video/Details/3', CAST(N'2018-11-18 11:01:38.747' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (51, 1, N'/Video/Index', CAST(N'2018-11-18 11:01:48.190' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (52, 1, N'/Video/Details/1', CAST(N'2018-11-18 11:01:50.433' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (53, 1, N'/Video/Index', CAST(N'2018-11-18 11:01:52.867' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (54, 1, N'/Video/Details/3', CAST(N'2018-11-18 11:02:24.623' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (55, 1, N'/Video/Index', CAST(N'2018-11-18 11:03:20.273' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (56, 1, N'/Video/Details/3', CAST(N'2018-11-18 11:03:26.770' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (57, 1, N'/Video/Index', CAST(N'2018-11-18 11:03:31.687' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (58, 1, N'/Video/Details/3', CAST(N'2018-11-18 11:03:50.860' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (59, 1, N'/Video/Index', CAST(N'2018-11-18 11:03:56.330' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (60, 1, N'/Video/Details/1', CAST(N'2018-11-18 11:03:59.423' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (61, 1, N'/Video/Index', CAST(N'2018-11-18 11:04:02.560' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (62, 1, N'/Video/Edit/1', CAST(N'2018-11-18 11:04:17.867' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (63, 1, N'/Video/Index', CAST(N'2018-11-18 11:04:20.307' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (64, 1, N'/Video/Edit/3', CAST(N'2018-11-18 11:04:43.637' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (65, 1, N'/Video/Edit/3', CAST(N'2018-11-18 11:05:17.317' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (66, 1, N'/Video/Index', CAST(N'2018-11-18 11:05:22.583' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (67, 1, N'/Video/Create', CAST(N'2018-11-18 11:07:00.870' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (68, 1, N'/Video/Create', CAST(N'2018-11-18 11:08:12.100' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (69, 1, N'/Video/Index', CAST(N'2018-11-18 11:08:41.067' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (70, 1, N'/Video/Details/4', CAST(N'2018-11-18 11:08:44.897' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (71, 1, N'/Video/Index', CAST(N'2018-11-18 11:08:48.667' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (72, 1, N'/Video/Create', CAST(N'2018-11-18 11:09:05.517' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (73, 1, N'/Video/Index', CAST(N'2018-11-18 11:09:21.873' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (74, 1, N'/Video/Details/5', CAST(N'2018-11-18 11:09:26.527' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (75, 1, N'/Video/Index', CAST(N'2018-11-18 11:09:28.937' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (76, 1, N'/Video/Create', CAST(N'2018-11-18 11:09:40.307' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (77, 1, N'/Video/Index', CAST(N'2018-11-18 11:09:53.407' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (78, 1, N'/Video/Details/6', CAST(N'2018-11-18 11:09:56.880' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (79, 1, N'/Video/Index', CAST(N'2018-11-18 11:09:59.100' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (80, 1, N'/dashboard', CAST(N'2018-11-18 11:11:10.920' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (81, 1, N'/Student/Index', CAST(N'2018-11-18 11:11:22.530' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (82, 1, N'/Employee/Index', CAST(N'2018-11-18 11:11:43.667' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (83, 1, N'/Employee/Edit/1', CAST(N'2018-11-18 11:15:27.950' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (84, 1, N'/Employee/Index', CAST(N'2018-11-18 11:15:29.767' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (85, 1, N'/Employee/Index', CAST(N'2018-11-18 11:17:38.917' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (86, 1, N'/User/Edit/1', CAST(N'2018-11-18 11:17:40.847' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (87, 1, N'/Employee/Index', CAST(N'2018-11-18 11:17:43.030' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (88, 1, N'/User/Edit/1', CAST(N'2018-11-18 11:17:45.663' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (89, 1, N'/Employee/Index', CAST(N'2018-11-18 11:17:49.457' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (90, 1, N'/User/Edit/1', CAST(N'2018-11-18 11:17:53.657' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (91, 1, N'/Employee/Index', CAST(N'2018-11-18 11:18:01.563' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (92, 1, N'/Video/Index', CAST(N'2018-11-18 11:18:06.653' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (93, 1, N'/Employee/Index', CAST(N'2018-11-18 11:18:09.077' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (94, 1, N'/Video/Index', CAST(N'2018-11-18 11:18:14.003' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (95, 1, N'/dashboard', CAST(N'2018-11-18 11:18:23.980' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (96, 1, N'/Video/Index', CAST(N'2018-11-18 11:18:26.477' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (97, 1, N'/Video/Create', CAST(N'2018-11-18 11:18:28.503' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (98, 1, N'/Video/Index', CAST(N'2018-11-18 11:18:31.027' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (99, 1, N'/Student/Index', CAST(N'2018-11-18 11:18:37.480' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (100, 1, N'/Student/Create', CAST(N'2018-11-18 11:18:45.060' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (101, 1, N'/Student/Index', CAST(N'2018-11-18 11:19:34.700' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (102, 1, N'/dashboard', CAST(N'2018-11-18 11:22:20.287' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (103, 1, N'/Student/Index', CAST(N'2018-11-18 11:22:30.927' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (104, 1, N'/Student/Create', CAST(N'2018-11-18 11:22:33.807' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (105, 1, N'/Student/Index', CAST(N'2018-11-18 11:22:36.307' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (106, 1, N'/Student/Create', CAST(N'2018-11-18 11:23:04.347' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (107, 1, N'/Student/Create', CAST(N'2018-11-18 11:23:55.873' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (108, 1, N'/dashboard', CAST(N'2018-11-18 11:26:06.020' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (109, 1, N'/Student/Index', CAST(N'2018-11-18 11:26:09.433' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (110, 1, N'/Account/NotAuthorised', CAST(N'2018-11-18 11:26:11.263' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (111, 1, N'/Student/Index', CAST(N'2018-11-18 11:26:13.457' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (112, 1, N'/dashboard', CAST(N'2018-11-18 11:32:44.523' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (113, 1, N'/dashboard', CAST(N'2018-11-18 11:35:23.760' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (114, 1, N'/PurchaseInvoice/Index', CAST(N'2018-11-18 11:36:00.650' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (115, 1, N'/PurchaseInvoice/CreateNew/1', CAST(N'2018-11-18 11:36:36.907' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (116, 1, N'/PurchaseInvoice/CreateNew/1', CAST(N'2018-11-18 11:36:41.710' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (117, 1, N'/PurchaseInvoice/CreateNew/1', CAST(N'2018-11-18 11:36:58.337' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (118, 1, N'/PurchaseInvoice/CreateNew/1', CAST(N'2018-11-18 11:37:13.073' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (119, 1, N'/PurchaseInvoice/CreateNew/1', CAST(N'2018-11-18 11:37:23.510' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (120, 1, N'/PurchaseInvoice/CreateNew/1', CAST(N'2018-11-18 11:37:31.607' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (121, 1, N'/PurchaseInvoice/Index', CAST(N'2018-11-18 11:39:57.200' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (122, 1, N'/PurchaseInvoice/Edit/1', CAST(N'2018-11-18 11:39:59.467' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (123, 1, N'/PurchaseInvoice/Edit/1', CAST(N'2018-11-18 11:40:02.233' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (124, 1, N'/PurchaseInvoice/Edit/1', CAST(N'2018-11-18 11:47:32.587' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (125, 1, N'/PurchaseInvoice/Index', CAST(N'2018-11-18 11:47:39.987' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (126, 1, N'/PurchaseInvoice/Edit/1', CAST(N'2018-11-18 11:47:42.140' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (127, 1, N'/dashboard', CAST(N'2018-11-18 11:52:09.530' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (128, 1, N'/PurchaseInvoice/Index', CAST(N'2018-11-18 11:52:13.667' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (129, 1, N'/PurchaseInvoice/Edit/1', CAST(N'2018-11-18 11:52:16.253' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (130, 1, N'/PurchaseInvoice/Edit/1', CAST(N'2018-11-18 11:52:18.400' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (131, 1, N'/PurchaseInvoice/Edit/1', CAST(N'2018-11-18 11:52:28.673' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (132, 1, N'/PurchaseInvoice/Edit/1', CAST(N'2018-11-18 11:52:39.680' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (133, 1, N'/Employee/Index', CAST(N'2018-11-18 11:54:10.537' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (134, 1, N'/Employee/Create', CAST(N'2018-11-18 11:54:13.193' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (135, 1, N'/Employee/Index', CAST(N'2018-11-18 11:54:52.283' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (136, 1, N'/PurchaseInvoice/Index', CAST(N'2018-11-18 11:54:57.363' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (137, 1, N'/PurchaseInvoice/Edit/1', CAST(N'2018-11-18 11:54:59.757' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (138, 1, N'/PurchaseInvoice/Edit/1', CAST(N'2018-11-18 11:55:04.980' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (139, 1, N'/PurchaseInvoice/Index', CAST(N'2018-11-18 11:55:14.737' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (140, 1, N'/PurchaseInvoice/CreateNew/2', CAST(N'2018-11-18 11:55:16.130' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (141, 1, N'/PurchaseInvoice/CreateNew/2', CAST(N'2018-11-18 11:55:26.610' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (142, 1, N'/PurchaseInvoice/Index', CAST(N'2018-11-18 11:55:29.330' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (143, 1, N'/dashboard', CAST(N'2018-11-18 12:48:02.280' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (144, 1, N'/dashboard', CAST(N'2018-11-18 12:49:47.960' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (145, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:50:00.277' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (146, 1, N'/dashboard', CAST(N'2018-11-18 12:51:29.897' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (147, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:51:33.047' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (148, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:51:42.287' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (149, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:51:44.847' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (150, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:51:53.130' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (151, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:53:21.773' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (152, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:53:24.917' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (153, 1, N'/dashboard', CAST(N'2018-11-18 12:54:53.467' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (154, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:55:15.513' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (155, 1, N'/Video/Index', CAST(N'2018-11-18 12:55:25.077' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (156, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:55:25.630' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (157, 1, N'/dashboard', CAST(N'2018-11-18 12:56:20.027' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (158, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:56:27.463' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (159, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:57:20.047' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (160, 1, N'/dashboard', CAST(N'2018-11-18 12:58:17.977' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (161, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:58:25.410' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (162, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:58:27.100' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (163, 1, N'/dashboard', CAST(N'2018-11-18 12:59:57.053' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (164, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 12:59:59.707' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (165, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:00:01.640' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (166, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:00:07.137' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (167, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:00:09.380' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (168, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:01:26.057' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (169, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:01:44.483' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (170, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:02:00.650' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (171, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:02:36.340' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (172, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:02:50.950' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (173, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:03:14.297' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (174, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:03:45.783' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (175, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:04:31.210' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (176, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:05:03.813' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (177, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:05:59.993' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (178, 1, N'/AccountHeadAssign/Index', CAST(N'2018-11-18 13:06:28.073' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (179, 1, N'/SalaryBook/Index', CAST(N'2018-11-18 13:07:04.450' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (180, 1, N'/SalaryBookEmployee/Index', CAST(N'2018-11-18 13:07:08.713' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (181, 1, N'/dashboard', CAST(N'2018-11-18 13:09:40.277' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (182, 1, N'/SalaryBook/Index', CAST(N'2018-11-18 13:09:45.677' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (183, 1, N'/SalaryBookEmployee/Index', CAST(N'2018-11-18 13:09:47.503' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (184, 1, N'/SalaryBookEmployee/Index', CAST(N'2018-11-18 13:09:52.317' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (185, 1, N'/SalaryBookEmployee/Index', CAST(N'2018-11-18 13:10:05.617' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (186, 1, N'/FeeBook/Index', CAST(N'2018-11-18 13:10:17.287' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (187, 1, N'/FeeBook/Index', CAST(N'2018-11-18 13:10:34.987' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (188, 1, N'/SalaryBook/Index', CAST(N'2018-11-18 13:10:40.567' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (189, 1, N'/SalaryBookTeacher/Index', CAST(N'2018-11-18 13:10:46.637' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (190, 1, N'/SalaryBookTeacher/Index', CAST(N'2018-11-18 13:11:00.403' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (191, 1, N'/FeeBook/Index', CAST(N'2018-11-18 13:11:04.710' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (192, 1, N'/FeeBook/Edit/1', CAST(N'2018-11-18 13:11:07.217' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (193, 1, N'/FeeBook/Index', CAST(N'2018-11-18 13:11:25.420' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (194, 1, N'/FeeBook/Edit/1', CAST(N'2018-11-18 13:11:30.203' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (195, 1, N'/FeeBook/Index', CAST(N'2018-11-18 13:11:34.357' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (196, 1, N'/DayBook/Index', CAST(N'2018-11-18 13:11:50.660' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (197, 1, N'/DayBook/Index', CAST(N'2018-11-18 13:11:56.860' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (198, 13, N'/dashboard', CAST(N'2018-11-18 20:17:51.517' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (199, 13, N'/School/Index', CAST(N'2018-11-18 20:18:12.500' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (200, 13, N'/Student/Index', CAST(N'2018-11-18 20:18:19.223' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (201, 1, N'/dashboard', CAST(N'2018-11-18 20:28:22.807' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (202, 1, N'/Student/Index', CAST(N'2018-11-18 20:28:26.880' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (203, 1, N'/Student/Details/4', CAST(N'2018-11-18 20:28:48.293' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (204, 1, N'/Student/Index', CAST(N'2018-11-18 20:28:50.620' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (205, 1, N'/Account/NotAuthorised', CAST(N'2018-11-18 20:28:52.707' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (206, 1, N'/Student/Index', CAST(N'2018-11-18 20:28:55.033' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (207, 1, N'/Account/NotAuthorised', CAST(N'2018-11-18 20:28:59.247' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (208, 1, N'/Student/Index', CAST(N'2018-11-18 20:29:00.997' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (209, 1, N'/Employee/Index', CAST(N'2018-11-18 20:29:22.707' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (210, 1, N'/Account/NotAuthorised', CAST(N'2018-11-18 20:29:27.230' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (211, 1, N'/Employee/Index', CAST(N'2018-11-18 20:29:29.113' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (212, 1, N'/Employee/Details/1', CAST(N'2018-11-18 20:29:33.520' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (213, 1, N'/Employee/Index', CAST(N'2018-11-18 20:29:35.283' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (214, 1, N'/Account/NotAuthorised', CAST(N'2018-11-18 20:29:38.337' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (215, 1, N'/Employee/Index', CAST(N'2018-11-18 20:29:39.920' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (216, 1, N'/dashboard', CAST(N'2018-11-18 20:30:10.677' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (217, 1, N'/Student/Index', CAST(N'2018-11-18 20:30:13.643' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (218, 1, N'/Account/NotAuthorised', CAST(N'2018-11-18 20:30:20.183' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (219, 1, N'/Student/Index', CAST(N'2018-11-18 20:30:22.697' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (220, 1, N'/dashboard', CAST(N'2018-11-18 20:32:29.633' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (221, 1, N'/Student/Index', CAST(N'2018-11-18 20:32:35.077' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (222, 1, N'/Student/Edit/8', CAST(N'2018-11-18 20:32:42.157' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (223, 1, N'/Student/Edit/8', CAST(N'2018-11-18 20:33:07.430' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (224, 1, N'/Student/Index', CAST(N'2018-11-18 20:33:11.320' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (225, 1, N'/Student/Edit/4', CAST(N'2018-11-18 20:33:17.937' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (226, 1, N'/Student/Index', CAST(N'2018-11-18 20:33:25.030' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (227, 1, N'/dashboard', CAST(N'2018-11-19 17:02:06.253' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (228, 1, N'/TaskList/Edit/1', CAST(N'2018-11-19 17:06:37.560' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (229, 1, N'/TaskList/Edit/1', CAST(N'2018-11-19 17:06:39.330' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (230, 1, N'/dashboard', CAST(N'2018-11-19 17:11:17.553' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (231, 1, N'/dashboard', CAST(N'2018-11-19 17:12:43.147' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (232, 1, N'/dashboard', CAST(N'2018-11-19 17:18:43.697' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (233, 1, N'/dashboard', CAST(N'2018-11-19 19:32:48.743' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (234, 1, N'/dashboard', CAST(N'2018-11-19 19:35:42.577' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (235, 1, N'/dashboard', CAST(N'2018-11-19 19:43:38.707' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (236, 1, N'/dashboard', CAST(N'2018-11-19 19:56:56.347' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (237, 1, N'/dashboard', CAST(N'2018-11-19 19:59:23.540' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (238, 1, N'/dashboard', CAST(N'2018-11-19 20:08:49.503' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (239, 1, N'/dashboard', CAST(N'2018-11-19 20:35:50.570' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (240, 1, N'/dashboard', CAST(N'2018-11-19 20:40:39.577' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (241, 1, N'/Notification/Edit/7', CAST(N'2018-11-19 20:41:59.870' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (242, 1, N'/dashboard', CAST(N'2018-11-19 20:43:22.010' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (243, 1, N'/Notification/Edit/7', CAST(N'2018-11-19 20:43:47.200' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (244, 1, N'/Notification/Edit/7', CAST(N'2018-11-19 20:44:40.850' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (245, 1, N'/dashboard', CAST(N'2018-11-19 20:48:59.117' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (246, 1, N'/Notification/Edit/7', CAST(N'2018-11-19 20:49:22.340' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (247, 1, N'/Notification/Edit/7', CAST(N'2018-11-19 20:49:41.557' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (248, 1, N'/dashboard', CAST(N'2018-11-19 21:14:57.650' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (249, 1, N'/Notification/Index', CAST(N'2018-11-19 21:15:01.037' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (250, 1, N'/dashboard', CAST(N'2018-11-19 21:17:14.280' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (251, 1, N'/Notification/Index', CAST(N'2018-11-19 21:17:17.163' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (252, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:17:25.483' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (253, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:18:13.437' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (254, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:18:49.813' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (255, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:19:04.443' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (256, 1, N'/dashboard', CAST(N'2018-11-19 21:24:15.970' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (257, 1, N'/Notification/Index', CAST(N'2018-11-19 21:24:21.123' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (258, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:24:27.210' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (259, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:24:39.317' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (260, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:26:49.967' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (261, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:27:21.110' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (262, 1, N'/TaskList/Edit/6', CAST(N'2018-11-19 21:27:40.370' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (263, 1, N'/Notification/Index', CAST(N'2018-11-19 21:30:28.883' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (264, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:30:37.977' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (265, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:30:49.883' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (266, 1, N'/dashboard', CAST(N'2018-11-19 21:36:16.350' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (267, 1, N'/Notification/Index', CAST(N'2018-11-19 21:36:19.487' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (268, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:37:12.973' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (269, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:38:05.313' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (270, 1, N'/NotificationSchool/Edit/7', CAST(N'2018-11-19 21:38:12.497' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (271, 1, N'/dashboard', CAST(N'2018-11-19 21:43:26.927' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (272, 1, N'/Notification/Index', CAST(N'2018-11-19 21:43:32.330' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (273, 1, N'/dashboard', CAST(N'2018-11-19 21:47:19.000' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (274, 1, N'/Notification/Index', CAST(N'2018-11-19 21:47:22.403' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (275, 1, N'/NotificationSchool/Edit/10', CAST(N'2018-11-19 21:47:40.093' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (276, 1, N'/NotificationSchool/Edit/10', CAST(N'2018-11-19 21:47:46.867' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (277, 1, N'/Notification/Index', CAST(N'2018-11-19 21:48:16.140' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (278, 1, N'/Notification/Index', CAST(N'2018-11-19 21:48:41.233' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (279, 1, N'/dashboard', CAST(N'2018-11-20 10:34:19.890' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (280, 1, N'/Notification/Index', CAST(N'2018-11-20 10:34:26.270' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (281, 1, N'/NotificationSchool/Edit/11', CAST(N'2018-11-20 10:34:49.760' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (282, 1, N'/dashboard', CAST(N'2018-11-20 10:49:57.127' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (283, 1, N'/Notification/Index', CAST(N'2018-11-20 10:50:00.493' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (284, 1, N'/NotificationParent/Edit/12', CAST(N'2018-11-20 10:50:15.347' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (285, 1, N'/NotificationParent/Edit/12', CAST(N'2018-11-20 10:50:21.617' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (286, 1, N'/dashboard', CAST(N'2018-11-20 11:00:38.310' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (287, 1, N'/Notification/Index', CAST(N'2018-11-20 11:00:41.763' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (288, 1, N'/dashboard', CAST(N'2018-11-20 11:09:56.300' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (289, 1, N'/Notification/Index', CAST(N'2018-11-20 11:10:01.003' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (290, 1, N'/NotificationSchool/Edit/1', CAST(N'2018-11-20 11:10:54.147' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (291, 1, N'/Notification/Index', CAST(N'2018-11-20 11:11:03.207' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (292, 1, N'/Notification/Index', CAST(N'2018-11-20 11:12:45.863' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (293, 1, N'/NotificationTeacher/Edit/2', CAST(N'2018-11-20 11:13:19.363' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (294, 1, N'/Notification/Index', CAST(N'2018-11-20 11:13:42.337' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (295, 1, N'/NotificationSchool/Edit/1', CAST(N'2018-11-20 11:13:47.507' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (296, 1, N'/Notification/Index', CAST(N'2018-11-20 11:13:56.427' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (297, 1, N'/Notification/Index', CAST(N'2018-11-20 11:15:07.543' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (298, 1, N'/Notification/Index', CAST(N'2018-11-20 11:15:53.860' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (299, 1, N'/School/Index', CAST(N'2018-11-20 11:17:00.887' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (300, 1, N'/dashboard', CAST(N'2018-11-20 12:50:25.170' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (301, 1, N'/Notification/Index', CAST(N'2018-11-20 12:50:29.337' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (302, 1, N'/dashboard', CAST(N'2018-11-20 12:52:32.623' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (303, 1, N'/Video/Index', CAST(N'2018-11-20 12:52:40.977' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (304, 1, N'/dashboard', CAST(N'2018-11-20 12:53:16.477' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (305, 1, N'/Notification/Index', CAST(N'2018-11-20 12:53:19.813' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (306, 1, N'/Notification/Index', CAST(N'2018-11-20 12:53:47.040' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (307, 1, N'/dashboard', CAST(N'2018-11-20 12:53:55.140' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (308, 1, N'/dashboard', CAST(N'2018-11-20 13:02:43.013' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (309, 1, N'/StudentAssignment/Edit/3', CAST(N'2018-11-20 13:06:33.370' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (310, 1, N'/StudentAssignment/Edit/3', CAST(N'2018-11-20 13:06:47.163' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (311, 1, N'/StudentAssignment/Edit/3', CAST(N'2018-11-20 13:08:19.167' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (312, 1, N'/StudentAssignment/Edit/3', CAST(N'2018-11-20 13:08:33.337' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (313, 1, N'/dashboard', CAST(N'2018-11-20 13:09:53.637' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (314, 1, N'/StudentAssignment/Edit/3', CAST(N'2018-11-20 13:10:05.563' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (315, 1, N'/Account/NotAuthorised', CAST(N'2018-11-20 13:10:16.930' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (316, 1, N'/Account/NotAuthorised', CAST(N'2018-11-20 13:17:00.980' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (317, 1, N'/Account/NotAuthorised', CAST(N'2018-11-20 13:17:12.257' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (318, 1, N'/Account/NotAuthorised', CAST(N'2018-11-20 13:22:02.947' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (319, 1, N'/dashboard', CAST(N'2018-11-20 13:24:46.700' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (320, 1, N'/Account/NotAuthorised', CAST(N'2018-11-20 13:25:50.667' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (321, 1, N'/Account/NotAuthorised', CAST(N'2018-11-20 13:25:57.407' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (322, 1, N'/dashboard', CAST(N'2018-11-20 13:30:40.230' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (323, 1, N'/dashboard', CAST(N'2018-11-20 13:32:32.427' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (324, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 13:32:39.530' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (325, 1, N'/dashboard', CAST(N'2018-11-20 13:33:58.957' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (326, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 13:34:05.550' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (327, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 13:34:10.787' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (328, 1, N'/dashboard', CAST(N'2018-11-20 13:38:37.750' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (329, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 13:38:47.793' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (330, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 13:39:05.860' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (331, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 13:39:11.013' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (332, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 13:39:15.230' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (333, 1, N'/dashboard', CAST(N'2018-11-20 13:43:16.423' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (334, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 13:43:24.807' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (335, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 13:43:31.440' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (336, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 13:43:35.783' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (337, 1, N'/dashboard', CAST(N'2018-11-20 17:27:07.350' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (338, 1, N'/StudentAssignment/Edit/3', CAST(N'2018-11-20 17:28:06.600' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (339, 1, N'/StudentAssignment/Submit/3', CAST(N'2018-11-20 17:28:35.070' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (340, 1, N'/dashboard', CAST(N'2018-11-20 17:32:05.960' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (341, 1, N'/dashboard', CAST(N'2018-11-20 17:34:22.907' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (342, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 17:34:48.957' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (343, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 17:35:16.947' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (344, 1, N'/dashboard', CAST(N'2018-11-20 17:36:45.207' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (345, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 17:36:55.090' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (346, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 17:37:01.563' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (347, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 17:37:15.230' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (348, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 17:37:27.347' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (349, 1, N'/dashboard', CAST(N'2018-11-20 17:40:07.943' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (350, 1, N'/StudentAssignment/Edit/3', CAST(N'2018-11-20 17:40:28.440' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (351, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 17:41:33.247' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (352, 1, N'/StudentAssignment/Edit/3', CAST(N'2018-11-20 17:41:45.543' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (353, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 17:41:59.767' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (354, 1, N'/StudentAssignment/EditSubmit/1', CAST(N'2018-11-20 17:42:10.253' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (355, 1, N'/dashboard', CAST(N'2018-11-20 17:47:39.883' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (356, 1, N'/dashboard', CAST(N'2018-11-20 18:05:18.557' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (357, 1, N'/dashboard', CAST(N'2018-11-20 18:08:47.737' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (358, 1, N'/dashboard', CAST(N'2018-11-20 18:15:20.520' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (359, 1, N'/dashboard', CAST(N'2018-11-20 18:16:56.350' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (360, 1, N'/dashboard', CAST(N'2018-11-20 18:18:49.263' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (361, 1, N'/dashboard', CAST(N'2018-11-20 18:23:38.420' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (362, 1, N'/StudentAssignment/Edit/1', CAST(N'2018-11-20 18:24:31.537' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (363, 1, N'/StudentAssignment/Edit/1', CAST(N'2018-11-20 18:27:00.900' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (364, 1, N'/StudentAssignment/Edit/1', CAST(N'2018-11-20 18:27:52.257' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (365, 1, N'/StudentAssignment/Edit/1', CAST(N'2018-11-20 18:28:33.497' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (366, 1, N'/StudentAssignment/Edit/1', CAST(N'2018-11-20 18:29:22.627' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (367, 1, N'/StudentAssignment/Edit/1', CAST(N'2018-11-20 18:29:41.723' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (368, 1, N'/StudentAssignment/Edit/1', CAST(N'2018-11-20 18:29:48.800' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (369, 1, N'/StudentAssignment/Edit/1', CAST(N'2018-11-20 18:30:10.267' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (370, 1, N'/StudentAssignment/Edit/1', CAST(N'2018-11-20 18:30:14.190' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (371, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 18:31:49.140' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (372, 1, N'/dashboard', CAST(N'2018-11-20 18:44:37.587' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (373, 1, N'/dashboard', CAST(N'2018-11-20 18:47:18.253' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (374, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 18:47:26.287' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (375, 1, N'/dashboard', CAST(N'2018-11-20 18:49:43.657' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (376, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 18:49:50.857' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (377, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 18:50:00.083' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (378, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 18:50:04.327' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (379, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 18:50:09.340' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (380, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 18:50:13.113' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (381, 1, N'/StudentAssignment/EditSubmit/3', CAST(N'2018-11-20 18:50:21.997' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (382, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 18:50:29.017' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (383, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 18:50:39.967' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (384, 1, N'/dashboard', CAST(N'2018-11-20 18:54:54.007' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (385, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 18:55:01.227' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (386, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 18:55:09.950' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (387, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 18:55:13.897' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (388, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 18:55:21.497' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (389, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 18:55:47.547' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (390, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 18:55:52.860' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (391, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 18:56:08.950' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (392, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 18:56:13.673' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (393, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 18:57:35.920' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (394, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 18:57:40.050' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (395, 1, N'/dashboard', CAST(N'2018-11-20 18:59:45.690' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (396, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 18:59:53.220' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (397, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 19:00:01.180' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (398, 1, N'/dashboard', CAST(N'2018-11-20 19:02:05.313' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (399, 1, N'/StudentAssignment/Submit/1', CAST(N'2018-11-20 19:02:11.627' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (400, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 19:02:20.707' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (401, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 19:02:58.740' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (402, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 19:03:50.777' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (403, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 19:04:30.743' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (404, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 19:05:48.247' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (405, 1, N'/dashboard', CAST(N'2018-11-20 19:11:47.397' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (406, 1, N'/StudentAssignment/Edit/1', CAST(N'2018-11-20 19:11:59.607' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (407, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 19:12:12.253' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (408, 1, N'/StudentAssignment/EditSubmit/2', CAST(N'2018-11-20 19:12:17.937' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (409, 1, N'/dashboard', CAST(N'2018-11-20 19:19:09.767' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (410, 1, N'/StudentAssignment/Submit/4', CAST(N'2018-11-20 19:19:36.633' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (411, 1, N'/StudentAssignment/Submit/4', CAST(N'2018-11-20 19:19:42.813' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (412, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:19:50.160' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (413, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:19:54.323' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (414, 1, N'/StudentAssignment/Submit/4', CAST(N'2018-11-20 19:20:07.587' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (415, 1, N'/StudentAssignment/Submit/4', CAST(N'2018-11-20 19:20:10.357' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (416, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:20:18.980' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (417, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:20:24.420' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (418, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:20:30.007' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (419, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:20:33.430' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (420, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:20:37.817' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (421, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:20:43.300' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (422, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:20:52.723' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (423, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:20:57.353' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (424, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:21:04.943' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (425, 1, N'/dashboard', CAST(N'2018-11-20 19:22:40.000' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (426, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:22:51.200' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (427, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:22:54.843' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (428, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:22:58.037' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (429, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:23:01.903' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (430, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:23:07.597' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (431, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:23:12.000' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (432, 1, N'/StudentAssignment/EditSubmit/4', CAST(N'2018-11-20 19:23:15.207' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (433, 1, N'/dashboard', CAST(N'2018-11-20 20:32:19.637' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (434, 1, N'/dashboard', CAST(N'2018-11-21 12:07:53.783' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (435, 1, N'/Video/Index', CAST(N'2018-11-21 12:07:59.513' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (436, 1, N'/Video/Create', CAST(N'2018-11-21 12:08:06.443' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (437, 1, N'/Video/Index', CAST(N'2018-11-21 12:08:26.093' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (438, 1, N'/dashboard', CAST(N'2018-11-21 12:09:46.673' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (439, 1, N'/Video/Index', CAST(N'2018-11-21 12:09:50.977' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (440, 1, N'/Video/Create', CAST(N'2018-11-21 12:09:52.620' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (441, 1, N'/Video/Index', CAST(N'2018-11-21 12:10:33.187' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (442, 1, N'/Video/Create', CAST(N'2018-11-21 12:10:47.643' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (443, 1, N'/Video/Index', CAST(N'2018-11-21 12:11:33.627' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (444, 1, N'/dashboard', CAST(N'2018-11-21 12:14:43.113' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (445, 1, N'/Video/Index', CAST(N'2018-11-21 12:14:46.297' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (446, 1, N'/Video/Create', CAST(N'2018-11-21 12:14:48.720' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (447, 1, N'/Video/Index', CAST(N'2018-11-21 12:17:35.097' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (448, 1, N'/dashboard', CAST(N'2018-11-21 12:21:29.650' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (449, 1, N'/Video/Index', CAST(N'2018-11-21 12:21:33.027' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (450, 1, N'/Video/Create', CAST(N'2018-11-21 12:21:34.673' AS DateTime))
GO
INSERT [dbo].[smsUserPageViews] ([UserPageViewID], [UserID], [PageUrl], [DateAccessed]) VALUES (451, 1, N'/Video/Index', CAST(N'2018-11-21 12:21:48.553' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsUserPageViews] OFF
GO
SET IDENTITY_INSERT [dbo].[smsUserRoles] ON 

GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (1, 1, 1)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (2, 2, 2)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (3, 3, 2)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (4, 4, 3)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (5, 5, 3)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (6, 6, 3)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (7, 7, 4)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (8, 8, 4)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (9, 9, 4)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (10, 10, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (11, 11, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (12, 12, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (13, 13, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (14, 14, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (15, 15, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (16, 16, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (17, 17, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (18, 18, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (19, 19, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (20, 20, 5)
GO
INSERT [dbo].[smsUserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (21, 21, 6)
GO
SET IDENTITY_INSERT [dbo].[smsUserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[smsUsers] ON 

GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (1, N'demo@malusoftindia.com', N'Admin@1234', 1, 1, 1, 1, 1, CAST(N'2018-11-16 14:10:32.550' AS DateTime), CAST(N'2018-11-21 12:21:25.260' AS DateTime))
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (2, N'demoschool2@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 14:25:36.790' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (3, N'demoschool3@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 14:26:21.587' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (4, N'demoteacherone@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 14:27:24.360' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (5, N'demoteacher2@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 14:28:00.763' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (6, N'demoteacher3@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 14:29:33.380' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (7, N'demoparent1@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 14:30:22.073' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (8, N'demoparent2@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 14:31:10.517' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (9, N'demoparent3@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 14:31:47.487' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (10, N'demostudent1@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:47:44.973' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (11, N'demostudent2@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:49:34.557' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (12, N'demostudent3@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:50:23.060' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (13, N'demostudent4@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:52:16.413' AS DateTime), CAST(N'2018-11-18 20:17:47.040' AS DateTime))
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (14, N'demostudent5@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:52:56.247' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (15, N'demostudent6@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:54:02.490' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (16, N'demostudent7@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:54:47.123' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (17, N'demostudent8@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:55:28.210' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (18, N'demostudent9@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:56:16.240' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (19, N'demostudent10@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:57:00.230' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (20, N'demostudent11@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-16 15:57:42.810' AS DateTime), NULL)
GO
INSERT [dbo].[smsUsers] ([UserID], [Email], [Password], [CanCreate], [CanEdit], [CanDelete], [CanPrint], [Status], [CreatedOn], [LastLoggedOn]) VALUES (21, N'demoemployee1@malusoftindia.com', N'Admin@1234', 0, 0, 0, 0, 1, CAST(N'2018-11-18 11:54:48.497' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[smsUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[smsVideos] ON 

GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (1, N'3gp file', N'demo', N'3gp', N'/Uploads/285bae2f-10f4-4c91-884d-60cc8771c4f3.3gp', NULL, 1, CAST(N'2018-11-18 10:47:20.000' AS DateTime))
GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (2, N'Flv file', N'demo', N'flv', N'/Uploads/e8e8182a-c387-491d-a8e7-308e886b2b3b.flv', NULL, 1, CAST(N'2018-11-18 10:53:08.000' AS DateTime))
GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (3, N'Mp4 file', N'demo', N'mp4', N'/Uploads/19bc75a0-371d-4592-ab80-3033270f0895.mp4', NULL, 1, CAST(N'2018-11-18 10:53:31.000' AS DateTime))
GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (4, N'Webm file', N'demo', N'.webm', N'/Uploads/2b3bf5e1-d63d-455f-b125-9f29b0063703.webm', NULL, 1, CAST(N'2018-11-18 11:08:06.000' AS DateTime))
GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (5, N'Avi file', N'demo', N'.avi', N'/Uploads/6b95eb8b-a7cf-47d9-87f0-a028538a7428.avi', NULL, 1, CAST(N'2018-11-18 11:09:04.000' AS DateTime))
GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (6, N'Mov file', N'demo', N'.mov', N'/Uploads/864e8c34-7d67-4450-a36f-38fc4a836b24.mov', NULL, 1, CAST(N'2018-11-18 11:09:39.000' AS DateTime))
GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (7, N'Demo', N'demo', N'.mp4', N'/Uploads/8eb58dc9-dddb-40c3-be70-2fea15ace9d5.mp4', NULL, 1, CAST(N'2018-11-21 12:08:05.000' AS DateTime))
GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (8, N'Demo', N'demo', N'.mp4', N'/Uploads/74fb2716-d3a6-4996-b50a-c2d6fdba3cad.mp4', NULL, 1, CAST(N'2018-11-21 12:09:52.000' AS DateTime))
GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (9, N'Fhfh', N'fghf', N'.mp4', N'/Uploads/3733e098-07a1-46f9-837a-b1793025d46b.mp4', NULL, 1, CAST(N'2018-11-21 12:10:47.000' AS DateTime))
GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (10, N'Sfsdf', N'fs', N'.flv', N'/Uploads/e6dbcf4e-1bd3-4408-8d72-318819cabcf2.flv', NULL, 1, CAST(N'2018-11-21 12:14:48.000' AS DateTime))
GO
INSERT [dbo].[smsVideos] ([VideoID], [Name], [Description], [FileExt], [VideoPath], [YoutubePath], [UserID], [Dou]) VALUES (11, N'Sdf', N'sdf', N'.flv', N'/Uploads/d2d64743-78d0-4374-ac97-e037037922de.flv', NULL, 1, CAST(N'2018-11-21 12:21:34.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[smsVideos] OFF
GO
SET IDENTITY_INSERT [dbo].[smsVoucherTypes] ON 

GO
INSERT [dbo].[smsVoucherTypes] ([VoucherTypeID], [Name]) VALUES (1, N'RECEIPT')
GO
INSERT [dbo].[smsVoucherTypes] ([VoucherTypeID], [Name]) VALUES (2, N'PAYMENT')
GO
SET IDENTITY_INSERT [dbo].[smsVoucherTypes] OFF
GO
/****** Object:  Index [IX_AccountJournalID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountJournalID] ON [dbo].[smsAccountBanks]
(
	[AccountJournalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BankID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_BankID] ON [dbo].[smsAccountBanks]
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountCategoryID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountCategoryID] ON [dbo].[smsAccountGroups]
(
	[AccountCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountGroupID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountGroupID] ON [dbo].[smsAccountHeads]
(
	[AccountGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountHeadID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountHeadID] ON [dbo].[smsAccountJournalDetails]
(
	[AccountHeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountJournalID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountJournalID] ON [dbo].[smsAccountJournalDetails]
(
	[AccountJournalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountHeadID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AccountHeadID] ON [dbo].[smsAccountOpenings]
(
	[AccountHeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AllocationGroupID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AllocationGroupID] ON [dbo].[smsAllocationTypes]
(
	[AllocationGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AnalysisGroupID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AnalysisGroupID] ON [dbo].[smsAnalysisHeads]
(
	[AnalysisGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AllocationTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AllocationTypeID] ON [dbo].[smsBankVoucherDetailAllocations]
(
	[AllocationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BankVoucherDetailID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_BankVoucherDetailID] ON [dbo].[smsBankVoucherDetailAllocations]
(
	[BankVoucherDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BankVoucherID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_BankVoucherID] ON [dbo].[smsBankVoucherDetails]
(
	[BankVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeID] ON [dbo].[smsBankVouchers]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VoucherTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_VoucherTypeID] ON [dbo].[smsBankVouchers]
(
	[VoucherTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AllocationTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AllocationTypeID] ON [dbo].[smsCashVoucherDetailAllocations]
(
	[AllocationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashVoucherDetailID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CashVoucherDetailID] ON [dbo].[smsCashVoucherDetailAllocations]
(
	[CashVoucherDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashVoucherID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CashVoucherID] ON [dbo].[smsCashVoucherDetails]
(
	[CashVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeID] ON [dbo].[smsCashVouchers]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VoucherTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_VoucherTypeID] ON [dbo].[smsCashVouchers]
(
	[VoucherTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectID] ON [dbo].[smsChapters]
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CityID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CityID] ON [dbo].[smsCompanies]
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CountryID] ON [dbo].[smsCompanies]
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrencyID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CurrencyID] ON [dbo].[smsCompanies]
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcademicYearID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AcademicYearID] ON [dbo].[smsCompanyAcademicYears]
(
	[AcademicYearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyID] ON [dbo].[smsCompanyAcademicYears]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CountryID] ON [dbo].[smsCurrencies]
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AttendanceTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AttendanceTypeID] ON [dbo].[smsEmployeeAttendances]
(
	[AttendanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeID] ON [dbo].[smsEmployeeAttendances]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[smsEmployeeAttendances]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CityID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CityID] ON [dbo].[smsEmployees]
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CountryID] ON [dbo].[smsEmployees]
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolID] ON [dbo].[smsEmployees]
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[smsEmployees]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_ChapterID] ON [dbo].[smsExamPortions]
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_ExamID] ON [dbo].[smsExamPortions]
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TopicID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_TopicID] ON [dbo].[smsExamPortions]
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolID] ON [dbo].[smsExams]
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectID] ON [dbo].[smsExams]
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_StudentID] ON [dbo].[smsFeeBook]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AllocationTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AllocationTypeID] ON [dbo].[smsJournalVoucherDetailAllocations]
(
	[AllocationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JournalVoucherDetailID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_JournalVoucherDetailID] ON [dbo].[smsJournalVoucherDetailAllocations]
(
	[JournalVoucherDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DebitCreditID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_DebitCreditID] ON [dbo].[smsJournalVoucherDetails]
(
	[DebitCreditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JournalVoucherID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_JournalVoucherID] ON [dbo].[smsJournalVoucherDetails]
(
	[JournalVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrentEmployee_EmployeeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CurrentEmployee_EmployeeID] ON [dbo].[smsJournalVouchers]
(
	[CurrentEmployee_EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrentVoucherType_VoucherTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CurrentVoucherType_VoucherTypeID] ON [dbo].[smsJournalVouchers]
(
	[CurrentVoucherType_VoucherTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeID] ON [dbo].[smsNotificationEmployees]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NotificationID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_NotificationID] ON [dbo].[smsNotificationEmployees]
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NotificationID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_NotificationID] ON [dbo].[smsNotificationParents]
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_ParentID] ON [dbo].[smsNotificationParents]
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NotificationTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_NotificationTypeID] ON [dbo].[smsNotifications]
(
	[NotificationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NotificationID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_NotificationID] ON [dbo].[smsNotificationSchools]
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolID] ON [dbo].[smsNotificationSchools]
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NotificationID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_NotificationID] ON [dbo].[smsNotificationStudents]
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_StudentID] ON [dbo].[smsNotificationStudents]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NotificationID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_NotificationID] ON [dbo].[smsNotificationTeachers]
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeacherID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_TeacherID] ON [dbo].[smsNotificationTeachers]
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CityID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CityID] ON [dbo].[smsParents]
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CountryID] ON [dbo].[smsParents]
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolID] ON [dbo].[smsParents]
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[smsParents]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostDatedChequeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_PostDatedChequeID] ON [dbo].[smsPostDatedChequeDetails]
(
	[PostDatedChequeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BankID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_BankID] ON [dbo].[smsPostDatedCheques]
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VoucherTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_VoucherTypeID] ON [dbo].[smsPostDatedCheques]
(
	[VoucherTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseInvoiceID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseInvoiceID] ON [dbo].[smsPurchaseInvoiceDetails]
(
	[PurchaseInvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrencyID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CurrencyID] ON [dbo].[smsPurchaseInvoices]
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscountTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_DiscountTypeID] ON [dbo].[smsPurchaseInvoices]
(
	[DiscountTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeID] ON [dbo].[smsPurchaseInvoices]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplierID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SupplierID] ON [dbo].[smsPurchaseInvoices]
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeID] ON [dbo].[smsSalaryBookEmployee]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeacherID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_TeacherID] ON [dbo].[smsSalaryBookTeacher]
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CityID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CityID] ON [dbo].[smsSchools]
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyAcademicYearID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyAcademicYearID] ON [dbo].[smsSchools]
(
	[CompanyAcademicYearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CountryID] ON [dbo].[smsSchools]
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[smsSchools]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AttendanceTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AttendanceTypeID] ON [dbo].[smsStudentAttendances]
(
	[AttendanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_StudentID] ON [dbo].[smsStudentAttendances]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[smsStudentAttendances]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClassID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClassID] ON [dbo].[smsStudents]
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParentID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_ParentID] ON [dbo].[smsStudents]
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolID] ON [dbo].[smsStudents]
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SectionID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SectionID] ON [dbo].[smsStudents]
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[smsStudents]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClassID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClassID] ON [dbo].[smsSubjects]
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MainMenuID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_MainMenuID] ON [dbo].[smsSubMenu]
(
	[MainMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeID] ON [dbo].[smsTaskEmployees]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaskListID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_TaskListID] ON [dbo].[smsTaskEmployees]
(
	[TaskListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaskPriorityID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_TaskPriorityID] ON [dbo].[smsTaskTaskLists]
(
	[TaskPriorityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaskStatusID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_TaskStatusID] ON [dbo].[smsTaskTaskLists]
(
	[TaskStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaskTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_TaskTypeID] ON [dbo].[smsTaskTaskLists]
(
	[TaskTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AttendanceTypeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_AttendanceTypeID] ON [dbo].[smsTeacherAttendances]
(
	[AttendanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeacherID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_TeacherID] ON [dbo].[smsTeacherAttendances]
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[smsTeacherAttendances]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CityID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CityID] ON [dbo].[smsTeachers]
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CountryID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_CountryID] ON [dbo].[smsTeachers]
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolID] ON [dbo].[smsTeachers]
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[smsTeachers]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClassID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClassID] ON [dbo].[smsTimeTables]
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_EmployeeID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_EmployeeID] ON [dbo].[smsTimeTables]
(
	[Employee_EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PeriodID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_PeriodID] ON [dbo].[smsTimeTables]
(
	[PeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolID] ON [dbo].[smsTimeTables]
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SectionID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SectionID] ON [dbo].[smsTimeTables]
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubjectID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_SubjectID] ON [dbo].[smsTimeTables]
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeacherID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_TeacherID] ON [dbo].[smsTimeTables]
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChapterID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_ChapterID] ON [dbo].[smsTopics]
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleID] ON [dbo].[smsUserRoles]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 11/24/2018 7:28:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[smsUserRoles]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[smsStudentAssignments] ADD  DEFAULT ((0)) FOR [ClassID]
GO
ALTER TABLE [dbo].[smsStudentAssignments] ADD  DEFAULT ('') FOR [Detail]
GO
ALTER TABLE [dbo].[smsAccountBanks]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsAccountBanks_dbo.smsAccountJournals_AccountJournalID] FOREIGN KEY([AccountJournalID])
REFERENCES [dbo].[smsAccountJournals] ([AccountJournalID])
GO
ALTER TABLE [dbo].[smsAccountBanks] CHECK CONSTRAINT [FK_dbo.smsAccountBanks_dbo.smsAccountJournals_AccountJournalID]
GO
ALTER TABLE [dbo].[smsAccountBanks]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsAccountBanks_dbo.smsBanks_BankID] FOREIGN KEY([BankID])
REFERENCES [dbo].[smsBanks] ([BankID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[smsAccountBanks] CHECK CONSTRAINT [FK_dbo.smsAccountBanks_dbo.smsBanks_BankID]
GO
ALTER TABLE [dbo].[smsAccountGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsAccountGroups_dbo.smsAccountCategories_AccountCategoryID] FOREIGN KEY([AccountCategoryID])
REFERENCES [dbo].[smsAccountCategories] ([AccountCategoryID])
GO
ALTER TABLE [dbo].[smsAccountGroups] CHECK CONSTRAINT [FK_dbo.smsAccountGroups_dbo.smsAccountCategories_AccountCategoryID]
GO
ALTER TABLE [dbo].[smsAccountHeads]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsAccountHeads_dbo.smsAccountGroups_AccountGroupID] FOREIGN KEY([AccountGroupID])
REFERENCES [dbo].[smsAccountGroups] ([AccountGroupID])
GO
ALTER TABLE [dbo].[smsAccountHeads] CHECK CONSTRAINT [FK_dbo.smsAccountHeads_dbo.smsAccountGroups_AccountGroupID]
GO
ALTER TABLE [dbo].[smsAccountJournalDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsAccountJournalDetails_dbo.smsAccountHeads_AccountHeadID] FOREIGN KEY([AccountHeadID])
REFERENCES [dbo].[smsAccountHeads] ([AccountHeadID])
GO
ALTER TABLE [dbo].[smsAccountJournalDetails] CHECK CONSTRAINT [FK_dbo.smsAccountJournalDetails_dbo.smsAccountHeads_AccountHeadID]
GO
ALTER TABLE [dbo].[smsAccountJournalDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsAccountJournalDetails_dbo.smsAccountJournals_AccountJournalID] FOREIGN KEY([AccountJournalID])
REFERENCES [dbo].[smsAccountJournals] ([AccountJournalID])
GO
ALTER TABLE [dbo].[smsAccountJournalDetails] CHECK CONSTRAINT [FK_dbo.smsAccountJournalDetails_dbo.smsAccountJournals_AccountJournalID]
GO
ALTER TABLE [dbo].[smsAccountOpenings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsAccountOpenings_dbo.smsAccountHeads_AccountHeadID] FOREIGN KEY([AccountHeadID])
REFERENCES [dbo].[smsAccountHeads] ([AccountHeadID])
GO
ALTER TABLE [dbo].[smsAccountOpenings] CHECK CONSTRAINT [FK_dbo.smsAccountOpenings_dbo.smsAccountHeads_AccountHeadID]
GO
ALTER TABLE [dbo].[smsAllocationTypes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsAllocationTypes_dbo.smsAllocationGroups_AllocationGroupID] FOREIGN KEY([AllocationGroupID])
REFERENCES [dbo].[smsAllocationGroups] ([AllocationGroupID])
GO
ALTER TABLE [dbo].[smsAllocationTypes] CHECK CONSTRAINT [FK_dbo.smsAllocationTypes_dbo.smsAllocationGroups_AllocationGroupID]
GO
ALTER TABLE [dbo].[smsAnalysisHeads]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsAnalysisHeads_dbo.smsAnalysisGroups_AnalysisGroupID] FOREIGN KEY([AnalysisGroupID])
REFERENCES [dbo].[smsAnalysisGroups] ([AnalysisGroupID])
GO
ALTER TABLE [dbo].[smsAnalysisHeads] CHECK CONSTRAINT [FK_dbo.smsAnalysisHeads_dbo.smsAnalysisGroups_AnalysisGroupID]
GO
ALTER TABLE [dbo].[smsBankVoucherDetailAllocations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsBankVoucherDetailAllocations_dbo.smsAllocationTypes_AllocationTypeID] FOREIGN KEY([AllocationTypeID])
REFERENCES [dbo].[smsAllocationTypes] ([AllocationTypeID])
GO
ALTER TABLE [dbo].[smsBankVoucherDetailAllocations] CHECK CONSTRAINT [FK_dbo.smsBankVoucherDetailAllocations_dbo.smsAllocationTypes_AllocationTypeID]
GO
ALTER TABLE [dbo].[smsBankVoucherDetailAllocations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsBankVoucherDetailAllocations_dbo.smsBankVoucherDetails_BankVoucherDetailID] FOREIGN KEY([BankVoucherDetailID])
REFERENCES [dbo].[smsBankVoucherDetails] ([BankVoucherDetailID])
GO
ALTER TABLE [dbo].[smsBankVoucherDetailAllocations] CHECK CONSTRAINT [FK_dbo.smsBankVoucherDetailAllocations_dbo.smsBankVoucherDetails_BankVoucherDetailID]
GO
ALTER TABLE [dbo].[smsBankVoucherDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsBankVoucherDetails_dbo.smsBankVouchers_BankVoucherID] FOREIGN KEY([BankVoucherID])
REFERENCES [dbo].[smsBankVouchers] ([BankVoucherID])
GO
ALTER TABLE [dbo].[smsBankVoucherDetails] CHECK CONSTRAINT [FK_dbo.smsBankVoucherDetails_dbo.smsBankVouchers_BankVoucherID]
GO
ALTER TABLE [dbo].[smsBankVouchers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsBankVouchers_dbo.smsEmployees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[smsEmployees] ([EmployeeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[smsBankVouchers] CHECK CONSTRAINT [FK_dbo.smsBankVouchers_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsBankVouchers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsBankVouchers_dbo.smsVoucherTypes_VoucherTypeID] FOREIGN KEY([VoucherTypeID])
REFERENCES [dbo].[smsVoucherTypes] ([VoucherTypeID])
GO
ALTER TABLE [dbo].[smsBankVouchers] CHECK CONSTRAINT [FK_dbo.smsBankVouchers_dbo.smsVoucherTypes_VoucherTypeID]
GO
ALTER TABLE [dbo].[smsCashVoucherDetailAllocations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCashVoucherDetailAllocations_dbo.smsAllocationTypes_AllocationTypeID] FOREIGN KEY([AllocationTypeID])
REFERENCES [dbo].[smsAllocationTypes] ([AllocationTypeID])
GO
ALTER TABLE [dbo].[smsCashVoucherDetailAllocations] CHECK CONSTRAINT [FK_dbo.smsCashVoucherDetailAllocations_dbo.smsAllocationTypes_AllocationTypeID]
GO
ALTER TABLE [dbo].[smsCashVoucherDetailAllocations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCashVoucherDetailAllocations_dbo.smsCashVoucherDetails_CashVoucherDetailID] FOREIGN KEY([CashVoucherDetailID])
REFERENCES [dbo].[smsCashVoucherDetails] ([CashVoucherDetailID])
GO
ALTER TABLE [dbo].[smsCashVoucherDetailAllocations] CHECK CONSTRAINT [FK_dbo.smsCashVoucherDetailAllocations_dbo.smsCashVoucherDetails_CashVoucherDetailID]
GO
ALTER TABLE [dbo].[smsCashVoucherDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCashVoucherDetails_dbo.smsCashVouchers_CashVoucherID] FOREIGN KEY([CashVoucherID])
REFERENCES [dbo].[smsCashVouchers] ([CashVoucherID])
GO
ALTER TABLE [dbo].[smsCashVoucherDetails] CHECK CONSTRAINT [FK_dbo.smsCashVoucherDetails_dbo.smsCashVouchers_CashVoucherID]
GO
ALTER TABLE [dbo].[smsCashVouchers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCashVouchers_dbo.smsEmployees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[smsEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[smsCashVouchers] CHECK CONSTRAINT [FK_dbo.smsCashVouchers_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsCashVouchers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCashVouchers_dbo.smsVoucherTypes_VoucherTypeID] FOREIGN KEY([VoucherTypeID])
REFERENCES [dbo].[smsVoucherTypes] ([VoucherTypeID])
GO
ALTER TABLE [dbo].[smsCashVouchers] CHECK CONSTRAINT [FK_dbo.smsCashVouchers_dbo.smsVoucherTypes_VoucherTypeID]
GO
ALTER TABLE [dbo].[smsChapters]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsChapters_dbo.smsSubjects_SubjectID] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[smsSubjects] ([SubjectID])
GO
ALTER TABLE [dbo].[smsChapters] CHECK CONSTRAINT [FK_dbo.smsChapters_dbo.smsSubjects_SubjectID]
GO
ALTER TABLE [dbo].[smsCompanies]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCompanies_dbo.smsCities_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[smsCities] ([CityID])
GO
ALTER TABLE [dbo].[smsCompanies] CHECK CONSTRAINT [FK_dbo.smsCompanies_dbo.smsCities_CityID]
GO
ALTER TABLE [dbo].[smsCompanies]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCompanies_dbo.smsCountries_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[smsCountries] ([CountryID])
GO
ALTER TABLE [dbo].[smsCompanies] CHECK CONSTRAINT [FK_dbo.smsCompanies_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsCompanies]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCompanies_dbo.smsCurrencies_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[smsCurrencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[smsCompanies] CHECK CONSTRAINT [FK_dbo.smsCompanies_dbo.smsCurrencies_CurrencyID]
GO
ALTER TABLE [dbo].[smsCompanyAcademicYears]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCompanyAcademicYears_dbo.smsAcademicYears_AcademicYearID] FOREIGN KEY([AcademicYearID])
REFERENCES [dbo].[smsAcademicYears] ([AcademicYearID])
GO
ALTER TABLE [dbo].[smsCompanyAcademicYears] CHECK CONSTRAINT [FK_dbo.smsCompanyAcademicYears_dbo.smsAcademicYears_AcademicYearID]
GO
ALTER TABLE [dbo].[smsCompanyAcademicYears]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCompanyAcademicYears_dbo.smsCompanies_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[smsCompanies] ([CompanyID])
GO
ALTER TABLE [dbo].[smsCompanyAcademicYears] CHECK CONSTRAINT [FK_dbo.smsCompanyAcademicYears_dbo.smsCompanies_CompanyID]
GO
ALTER TABLE [dbo].[smsCurrencies]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsCurrencies_dbo.smsCountries_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[smsCountries] ([CountryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[smsCurrencies] CHECK CONSTRAINT [FK_dbo.smsCurrencies_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsEmployeeAttendances]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsEmployeeAttendances_dbo.smsAttendanceTypes_AttendanceTypeID] FOREIGN KEY([AttendanceTypeID])
REFERENCES [dbo].[smsAttendanceTypes] ([AttendanceTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[smsEmployeeAttendances] CHECK CONSTRAINT [FK_dbo.smsEmployeeAttendances_dbo.smsAttendanceTypes_AttendanceTypeID]
GO
ALTER TABLE [dbo].[smsEmployeeAttendances]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsEmployeeAttendances_dbo.smsEmployees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[smsEmployees] ([EmployeeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[smsEmployeeAttendances] CHECK CONSTRAINT [FK_dbo.smsEmployeeAttendances_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsEmployeeAttendances]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsEmployeeAttendances_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[smsEmployeeAttendances] CHECK CONSTRAINT [FK_dbo.smsEmployeeAttendances_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsEmployees]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsEmployees_dbo.smsCities_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[smsCities] ([CityID])
GO
ALTER TABLE [dbo].[smsEmployees] CHECK CONSTRAINT [FK_dbo.smsEmployees_dbo.smsCities_CityID]
GO
ALTER TABLE [dbo].[smsEmployees]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsEmployees_dbo.smsCountries_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[smsCountries] ([CountryID])
GO
ALTER TABLE [dbo].[smsEmployees] CHECK CONSTRAINT [FK_dbo.smsEmployees_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsEmployees]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsEmployees_dbo.smsSchools_SchoolID] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[smsSchools] ([SchoolID])
GO
ALTER TABLE [dbo].[smsEmployees] CHECK CONSTRAINT [FK_dbo.smsEmployees_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsEmployees]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsEmployees_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
GO
ALTER TABLE [dbo].[smsEmployees] CHECK CONSTRAINT [FK_dbo.smsEmployees_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsExamPortions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsExamPortions_dbo.smsChapters_ChapterID] FOREIGN KEY([ChapterID])
REFERENCES [dbo].[smsChapters] ([ChapterID])
GO
ALTER TABLE [dbo].[smsExamPortions] CHECK CONSTRAINT [FK_dbo.smsExamPortions_dbo.smsChapters_ChapterID]
GO
ALTER TABLE [dbo].[smsExamPortions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsExamPortions_dbo.smsExams_ExamID] FOREIGN KEY([ExamID])
REFERENCES [dbo].[smsExams] ([ExamID])
GO
ALTER TABLE [dbo].[smsExamPortions] CHECK CONSTRAINT [FK_dbo.smsExamPortions_dbo.smsExams_ExamID]
GO
ALTER TABLE [dbo].[smsExamPortions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsExamPortions_dbo.smsTopics_TopicID] FOREIGN KEY([TopicID])
REFERENCES [dbo].[smsTopics] ([TopicID])
GO
ALTER TABLE [dbo].[smsExamPortions] CHECK CONSTRAINT [FK_dbo.smsExamPortions_dbo.smsTopics_TopicID]
GO
ALTER TABLE [dbo].[smsExams]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsExams_dbo.smsSchools_SchoolID] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[smsSchools] ([SchoolID])
GO
ALTER TABLE [dbo].[smsExams] CHECK CONSTRAINT [FK_dbo.smsExams_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsExams]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsExams_dbo.smsSubjects_SubjectID] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[smsSubjects] ([SubjectID])
GO
ALTER TABLE [dbo].[smsExams] CHECK CONSTRAINT [FK_dbo.smsExams_dbo.smsSubjects_SubjectID]
GO
ALTER TABLE [dbo].[smsFeeBook]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsFeeBook_dbo.smsStudents_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[smsStudents] ([StudentID])
GO
ALTER TABLE [dbo].[smsFeeBook] CHECK CONSTRAINT [FK_dbo.smsFeeBook_dbo.smsStudents_StudentID]
GO
ALTER TABLE [dbo].[smsJournalVoucherDetailAllocations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsJournalVoucherDetailAllocations_dbo.smsAllocationTypes_AllocationTypeID] FOREIGN KEY([AllocationTypeID])
REFERENCES [dbo].[smsAllocationTypes] ([AllocationTypeID])
GO
ALTER TABLE [dbo].[smsJournalVoucherDetailAllocations] CHECK CONSTRAINT [FK_dbo.smsJournalVoucherDetailAllocations_dbo.smsAllocationTypes_AllocationTypeID]
GO
ALTER TABLE [dbo].[smsJournalVoucherDetailAllocations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsJournalVoucherDetailAllocations_dbo.smsJournalVoucherDetails_JournalVoucherDetailID] FOREIGN KEY([JournalVoucherDetailID])
REFERENCES [dbo].[smsJournalVoucherDetails] ([JournalVoucherDetailID])
GO
ALTER TABLE [dbo].[smsJournalVoucherDetailAllocations] CHECK CONSTRAINT [FK_dbo.smsJournalVoucherDetailAllocations_dbo.smsJournalVoucherDetails_JournalVoucherDetailID]
GO
ALTER TABLE [dbo].[smsJournalVoucherDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsJournalVoucherDetails_dbo.smsDebitCredits_DebitCreditID] FOREIGN KEY([DebitCreditID])
REFERENCES [dbo].[smsDebitCredits] ([DebitCreditID])
GO
ALTER TABLE [dbo].[smsJournalVoucherDetails] CHECK CONSTRAINT [FK_dbo.smsJournalVoucherDetails_dbo.smsDebitCredits_DebitCreditID]
GO
ALTER TABLE [dbo].[smsJournalVoucherDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsJournalVoucherDetails_dbo.smsJournalVouchers_JournalVoucherID] FOREIGN KEY([JournalVoucherID])
REFERENCES [dbo].[smsJournalVouchers] ([JournalVoucherID])
GO
ALTER TABLE [dbo].[smsJournalVoucherDetails] CHECK CONSTRAINT [FK_dbo.smsJournalVoucherDetails_dbo.smsJournalVouchers_JournalVoucherID]
GO
ALTER TABLE [dbo].[smsJournalVouchers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsJournalVouchers_dbo.smsEmployees_CurrentEmployee_EmployeeID] FOREIGN KEY([CurrentEmployee_EmployeeID])
REFERENCES [dbo].[smsEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[smsJournalVouchers] CHECK CONSTRAINT [FK_dbo.smsJournalVouchers_dbo.smsEmployees_CurrentEmployee_EmployeeID]
GO
ALTER TABLE [dbo].[smsJournalVouchers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsJournalVouchers_dbo.smsVoucherTypes_CurrentVoucherType_VoucherTypeID] FOREIGN KEY([CurrentVoucherType_VoucherTypeID])
REFERENCES [dbo].[smsVoucherTypes] ([VoucherTypeID])
GO
ALTER TABLE [dbo].[smsJournalVouchers] CHECK CONSTRAINT [FK_dbo.smsJournalVouchers_dbo.smsVoucherTypes_CurrentVoucherType_VoucherTypeID]
GO
ALTER TABLE [dbo].[smsNotificationEmployees]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotificationEmployees_dbo.smsEmployees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[smsEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[smsNotificationEmployees] CHECK CONSTRAINT [FK_dbo.smsNotificationEmployees_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsNotificationEmployees]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotificationEmployees_dbo.smsNotifications_NotificationID] FOREIGN KEY([NotificationID])
REFERENCES [dbo].[smsNotifications] ([NotificationID])
GO
ALTER TABLE [dbo].[smsNotificationEmployees] CHECK CONSTRAINT [FK_dbo.smsNotificationEmployees_dbo.smsNotifications_NotificationID]
GO
ALTER TABLE [dbo].[smsNotificationParents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotificationParents_dbo.smsNotifications_NotificationID] FOREIGN KEY([NotificationID])
REFERENCES [dbo].[smsNotifications] ([NotificationID])
GO
ALTER TABLE [dbo].[smsNotificationParents] CHECK CONSTRAINT [FK_dbo.smsNotificationParents_dbo.smsNotifications_NotificationID]
GO
ALTER TABLE [dbo].[smsNotificationParents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotificationParents_dbo.smsParents_ParentID] FOREIGN KEY([ParentID])
REFERENCES [dbo].[smsParents] ([ParentID])
GO
ALTER TABLE [dbo].[smsNotificationParents] CHECK CONSTRAINT [FK_dbo.smsNotificationParents_dbo.smsParents_ParentID]
GO
ALTER TABLE [dbo].[smsNotifications]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotifications_dbo.smsNotificationTypes_NotificationTypeID] FOREIGN KEY([NotificationTypeID])
REFERENCES [dbo].[smsNotificationTypes] ([NotificationTypeID])
GO
ALTER TABLE [dbo].[smsNotifications] CHECK CONSTRAINT [FK_dbo.smsNotifications_dbo.smsNotificationTypes_NotificationTypeID]
GO
ALTER TABLE [dbo].[smsNotificationSchools]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotificationSchools_dbo.smsNotifications_NotificationID] FOREIGN KEY([NotificationID])
REFERENCES [dbo].[smsNotifications] ([NotificationID])
GO
ALTER TABLE [dbo].[smsNotificationSchools] CHECK CONSTRAINT [FK_dbo.smsNotificationSchools_dbo.smsNotifications_NotificationID]
GO
ALTER TABLE [dbo].[smsNotificationSchools]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotificationSchools_dbo.smsSchools_SchoolID] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[smsSchools] ([SchoolID])
GO
ALTER TABLE [dbo].[smsNotificationSchools] CHECK CONSTRAINT [FK_dbo.smsNotificationSchools_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsNotificationStudents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotificationStudents_dbo.smsNotifications_NotificationID] FOREIGN KEY([NotificationID])
REFERENCES [dbo].[smsNotifications] ([NotificationID])
GO
ALTER TABLE [dbo].[smsNotificationStudents] CHECK CONSTRAINT [FK_dbo.smsNotificationStudents_dbo.smsNotifications_NotificationID]
GO
ALTER TABLE [dbo].[smsNotificationStudents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotificationStudents_dbo.smsStudents_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[smsStudents] ([StudentID])
GO
ALTER TABLE [dbo].[smsNotificationStudents] CHECK CONSTRAINT [FK_dbo.smsNotificationStudents_dbo.smsStudents_StudentID]
GO
ALTER TABLE [dbo].[smsNotificationTeachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotificationTeachers_dbo.smsNotifications_NotificationID] FOREIGN KEY([NotificationID])
REFERENCES [dbo].[smsNotifications] ([NotificationID])
GO
ALTER TABLE [dbo].[smsNotificationTeachers] CHECK CONSTRAINT [FK_dbo.smsNotificationTeachers_dbo.smsNotifications_NotificationID]
GO
ALTER TABLE [dbo].[smsNotificationTeachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsNotificationTeachers_dbo.smsTeachers_TeacherID] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[smsTeachers] ([TeacherID])
GO
ALTER TABLE [dbo].[smsNotificationTeachers] CHECK CONSTRAINT [FK_dbo.smsNotificationTeachers_dbo.smsTeachers_TeacherID]
GO
ALTER TABLE [dbo].[smsParents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsParents_dbo.smsCities_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[smsCities] ([CityID])
GO
ALTER TABLE [dbo].[smsParents] CHECK CONSTRAINT [FK_dbo.smsParents_dbo.smsCities_CityID]
GO
ALTER TABLE [dbo].[smsParents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsParents_dbo.smsCountries_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[smsCountries] ([CountryID])
GO
ALTER TABLE [dbo].[smsParents] CHECK CONSTRAINT [FK_dbo.smsParents_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsParents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsParents_dbo.smsSchools_SchoolID] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[smsSchools] ([SchoolID])
GO
ALTER TABLE [dbo].[smsParents] CHECK CONSTRAINT [FK_dbo.smsParents_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsParents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsParents_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
GO
ALTER TABLE [dbo].[smsParents] CHECK CONSTRAINT [FK_dbo.smsParents_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsPostDatedChequeDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsPostDatedChequeDetails_dbo.smsPostDatedCheques_PostDatedChequeID] FOREIGN KEY([PostDatedChequeID])
REFERENCES [dbo].[smsPostDatedCheques] ([PostDatedChequeID])
GO
ALTER TABLE [dbo].[smsPostDatedChequeDetails] CHECK CONSTRAINT [FK_dbo.smsPostDatedChequeDetails_dbo.smsPostDatedCheques_PostDatedChequeID]
GO
ALTER TABLE [dbo].[smsPostDatedCheques]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsPostDatedCheques_dbo.smsBanks_BankID] FOREIGN KEY([BankID])
REFERENCES [dbo].[smsBanks] ([BankID])
GO
ALTER TABLE [dbo].[smsPostDatedCheques] CHECK CONSTRAINT [FK_dbo.smsPostDatedCheques_dbo.smsBanks_BankID]
GO
ALTER TABLE [dbo].[smsPostDatedCheques]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsPostDatedCheques_dbo.smsVoucherTypes_VoucherTypeID] FOREIGN KEY([VoucherTypeID])
REFERENCES [dbo].[smsVoucherTypes] ([VoucherTypeID])
GO
ALTER TABLE [dbo].[smsPostDatedCheques] CHECK CONSTRAINT [FK_dbo.smsPostDatedCheques_dbo.smsVoucherTypes_VoucherTypeID]
GO
ALTER TABLE [dbo].[smsPurchaseInvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsPurchaseInvoiceDetails_dbo.smsPurchaseInvoices_PurchaseInvoiceID] FOREIGN KEY([PurchaseInvoiceID])
REFERENCES [dbo].[smsPurchaseInvoices] ([PurchaseInvoiceID])
GO
ALTER TABLE [dbo].[smsPurchaseInvoiceDetails] CHECK CONSTRAINT [FK_dbo.smsPurchaseInvoiceDetails_dbo.smsPurchaseInvoices_PurchaseInvoiceID]
GO
ALTER TABLE [dbo].[smsPurchaseInvoices]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsCurrencies_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[smsCurrencies] ([CurrencyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[smsPurchaseInvoices] CHECK CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsCurrencies_CurrencyID]
GO
ALTER TABLE [dbo].[smsPurchaseInvoices]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsDiscountTypes_DiscountTypeID] FOREIGN KEY([DiscountTypeID])
REFERENCES [dbo].[smsDiscountTypes] ([DiscountTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[smsPurchaseInvoices] CHECK CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsDiscountTypes_DiscountTypeID]
GO
ALTER TABLE [dbo].[smsPurchaseInvoices]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsEmployees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[smsEmployees] ([EmployeeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[smsPurchaseInvoices] CHECK CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsPurchaseInvoices]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsSuppliers_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[smsSuppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[smsPurchaseInvoices] CHECK CONSTRAINT [FK_dbo.smsPurchaseInvoices_dbo.smsSuppliers_SupplierID]
GO
ALTER TABLE [dbo].[smsSalaryBookEmployee]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSalaryBookEmployee_dbo.smsEmployees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[smsEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[smsSalaryBookEmployee] CHECK CONSTRAINT [FK_dbo.smsSalaryBookEmployee_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsSalaryBookTeacher]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSalaryBookTeacher_dbo.smsTeachers_TeacherID] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[smsTeachers] ([TeacherID])
GO
ALTER TABLE [dbo].[smsSalaryBookTeacher] CHECK CONSTRAINT [FK_dbo.smsSalaryBookTeacher_dbo.smsTeachers_TeacherID]
GO
ALTER TABLE [dbo].[smsSchools]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSchools_dbo.smsCities_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[smsCities] ([CityID])
GO
ALTER TABLE [dbo].[smsSchools] CHECK CONSTRAINT [FK_dbo.smsSchools_dbo.smsCities_CityID]
GO
ALTER TABLE [dbo].[smsSchools]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSchools_dbo.smsCompanyAcademicYears_CompanyAcademicYearID] FOREIGN KEY([CompanyAcademicYearID])
REFERENCES [dbo].[smsCompanyAcademicYears] ([CompanyAcademicYearID])
GO
ALTER TABLE [dbo].[smsSchools] CHECK CONSTRAINT [FK_dbo.smsSchools_dbo.smsCompanyAcademicYears_CompanyAcademicYearID]
GO
ALTER TABLE [dbo].[smsSchools]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSchools_dbo.smsCountries_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[smsCountries] ([CountryID])
GO
ALTER TABLE [dbo].[smsSchools] CHECK CONSTRAINT [FK_dbo.smsSchools_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsSchools]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSchools_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
GO
ALTER TABLE [dbo].[smsSchools] CHECK CONSTRAINT [FK_dbo.smsSchools_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsStudentAssignments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsClasses_ClassID] FOREIGN KEY([ClassID])
REFERENCES [dbo].[smsClasses] ([ClassID])
GO
ALTER TABLE [dbo].[smsStudentAssignments] CHECK CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsClasses_ClassID]
GO
ALTER TABLE [dbo].[smsStudentAssignments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsSections_SectionID] FOREIGN KEY([SectionID])
REFERENCES [dbo].[smsSections] ([SectionID])
GO
ALTER TABLE [dbo].[smsStudentAssignments] CHECK CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsSections_SectionID]
GO
ALTER TABLE [dbo].[smsStudentAssignments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsSubjects_SubjectID] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[smsSubjects] ([SubjectID])
GO
ALTER TABLE [dbo].[smsStudentAssignments] CHECK CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsSubjects_SubjectID]
GO
ALTER TABLE [dbo].[smsStudentAssignments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsTeachers_TeacherID] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[smsTeachers] ([TeacherID])
GO
ALTER TABLE [dbo].[smsStudentAssignments] CHECK CONSTRAINT [FK_dbo.smsSectionAssignments_dbo.smsTeachers_TeacherID]
GO
ALTER TABLE [dbo].[smsStudentAssignmentSubmissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSectionAssignmentSubmissions_dbo.smsSectionAssignments_StudentAssignmentID] FOREIGN KEY([StudentAssignmentID])
REFERENCES [dbo].[smsStudentAssignments] ([StudentAssignmentID])
GO
ALTER TABLE [dbo].[smsStudentAssignmentSubmissions] CHECK CONSTRAINT [FK_dbo.smsSectionAssignmentSubmissions_dbo.smsSectionAssignments_StudentAssignmentID]
GO
ALTER TABLE [dbo].[smsStudentAssignmentSubmissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSectionAssignmentSubmissions_dbo.smsStudents_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[smsStudents] ([StudentID])
GO
ALTER TABLE [dbo].[smsStudentAssignmentSubmissions] CHECK CONSTRAINT [FK_dbo.smsSectionAssignmentSubmissions_dbo.smsStudents_StudentID]
GO
ALTER TABLE [dbo].[smsStudentAttendances]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsStudentAttendances_dbo.smsAttendanceTypes_AttendanceTypeID] FOREIGN KEY([AttendanceTypeID])
REFERENCES [dbo].[smsAttendanceTypes] ([AttendanceTypeID])
GO
ALTER TABLE [dbo].[smsStudentAttendances] CHECK CONSTRAINT [FK_dbo.smsStudentAttendances_dbo.smsAttendanceTypes_AttendanceTypeID]
GO
ALTER TABLE [dbo].[smsStudentAttendances]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsStudentAttendances_dbo.smsStudents_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[smsStudents] ([StudentID])
GO
ALTER TABLE [dbo].[smsStudentAttendances] CHECK CONSTRAINT [FK_dbo.smsStudentAttendances_dbo.smsStudents_StudentID]
GO
ALTER TABLE [dbo].[smsStudentAttendances]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsStudentAttendances_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
GO
ALTER TABLE [dbo].[smsStudentAttendances] CHECK CONSTRAINT [FK_dbo.smsStudentAttendances_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsStudents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsStudents_dbo.smsClasses_ClassID] FOREIGN KEY([ClassID])
REFERENCES [dbo].[smsClasses] ([ClassID])
GO
ALTER TABLE [dbo].[smsStudents] CHECK CONSTRAINT [FK_dbo.smsStudents_dbo.smsClasses_ClassID]
GO
ALTER TABLE [dbo].[smsStudents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsStudents_dbo.smsParents_ParentID] FOREIGN KEY([ParentID])
REFERENCES [dbo].[smsParents] ([ParentID])
GO
ALTER TABLE [dbo].[smsStudents] CHECK CONSTRAINT [FK_dbo.smsStudents_dbo.smsParents_ParentID]
GO
ALTER TABLE [dbo].[smsStudents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsStudents_dbo.smsSchools_SchoolID] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[smsSchools] ([SchoolID])
GO
ALTER TABLE [dbo].[smsStudents] CHECK CONSTRAINT [FK_dbo.smsStudents_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsStudents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsStudents_dbo.smsSections_SectionID] FOREIGN KEY([SectionID])
REFERENCES [dbo].[smsSections] ([SectionID])
GO
ALTER TABLE [dbo].[smsStudents] CHECK CONSTRAINT [FK_dbo.smsStudents_dbo.smsSections_SectionID]
GO
ALTER TABLE [dbo].[smsStudents]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsStudents_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
GO
ALTER TABLE [dbo].[smsStudents] CHECK CONSTRAINT [FK_dbo.smsStudents_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsSubjects]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSubjects_dbo.smsClasses_ClassID] FOREIGN KEY([ClassID])
REFERENCES [dbo].[smsClasses] ([ClassID])
GO
ALTER TABLE [dbo].[smsSubjects] CHECK CONSTRAINT [FK_dbo.smsSubjects_dbo.smsClasses_ClassID]
GO
ALTER TABLE [dbo].[smsSubMenu]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsSubMenu_dbo.smsMainMenu_MainMenuID] FOREIGN KEY([MainMenuID])
REFERENCES [dbo].[smsMainMenu] ([MainMenuID])
GO
ALTER TABLE [dbo].[smsSubMenu] CHECK CONSTRAINT [FK_dbo.smsSubMenu_dbo.smsMainMenu_MainMenuID]
GO
ALTER TABLE [dbo].[smsTaskEmployees]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTaskEmployees_dbo.smsEmployees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[smsEmployees] ([EmployeeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[smsTaskEmployees] CHECK CONSTRAINT [FK_dbo.smsTaskEmployees_dbo.smsEmployees_EmployeeID]
GO
ALTER TABLE [dbo].[smsTaskEmployees]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTaskEmployees_dbo.smsTaskTaskLists_TaskListID] FOREIGN KEY([TaskListID])
REFERENCES [dbo].[smsTaskTaskLists] ([TaskListID])
GO
ALTER TABLE [dbo].[smsTaskEmployees] CHECK CONSTRAINT [FK_dbo.smsTaskEmployees_dbo.smsTaskTaskLists_TaskListID]
GO
ALTER TABLE [dbo].[smsTaskTaskLists]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTaskTaskLists_dbo.smsTaskPriorities_TaskPriorityID] FOREIGN KEY([TaskPriorityID])
REFERENCES [dbo].[smsTaskPriorities] ([TaskPriorityID])
GO
ALTER TABLE [dbo].[smsTaskTaskLists] CHECK CONSTRAINT [FK_dbo.smsTaskTaskLists_dbo.smsTaskPriorities_TaskPriorityID]
GO
ALTER TABLE [dbo].[smsTaskTaskLists]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTaskTaskLists_dbo.smsTaskStatuses_TaskStatusID] FOREIGN KEY([TaskStatusID])
REFERENCES [dbo].[smsTaskStatuses] ([TaskStatusID])
GO
ALTER TABLE [dbo].[smsTaskTaskLists] CHECK CONSTRAINT [FK_dbo.smsTaskTaskLists_dbo.smsTaskStatuses_TaskStatusID]
GO
ALTER TABLE [dbo].[smsTaskTaskLists]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTaskTaskLists_dbo.smsTaskTypes_TaskTypeID] FOREIGN KEY([TaskTypeID])
REFERENCES [dbo].[smsTaskTypes] ([TaskTypeID])
GO
ALTER TABLE [dbo].[smsTaskTaskLists] CHECK CONSTRAINT [FK_dbo.smsTaskTaskLists_dbo.smsTaskTypes_TaskTypeID]
GO
ALTER TABLE [dbo].[smsTeacherAttendances]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTeacherAttendances_dbo.smsAttendanceTypes_AttendanceTypeID] FOREIGN KEY([AttendanceTypeID])
REFERENCES [dbo].[smsAttendanceTypes] ([AttendanceTypeID])
GO
ALTER TABLE [dbo].[smsTeacherAttendances] CHECK CONSTRAINT [FK_dbo.smsTeacherAttendances_dbo.smsAttendanceTypes_AttendanceTypeID]
GO
ALTER TABLE [dbo].[smsTeacherAttendances]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTeacherAttendances_dbo.smsTeachers_TeacherID] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[smsTeachers] ([TeacherID])
GO
ALTER TABLE [dbo].[smsTeacherAttendances] CHECK CONSTRAINT [FK_dbo.smsTeacherAttendances_dbo.smsTeachers_TeacherID]
GO
ALTER TABLE [dbo].[smsTeacherAttendances]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTeacherAttendances_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
GO
ALTER TABLE [dbo].[smsTeacherAttendances] CHECK CONSTRAINT [FK_dbo.smsTeacherAttendances_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsTeachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTeachers_dbo.smsCities_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[smsCities] ([CityID])
GO
ALTER TABLE [dbo].[smsTeachers] CHECK CONSTRAINT [FK_dbo.smsTeachers_dbo.smsCities_CityID]
GO
ALTER TABLE [dbo].[smsTeachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTeachers_dbo.smsCountries_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[smsCountries] ([CountryID])
GO
ALTER TABLE [dbo].[smsTeachers] CHECK CONSTRAINT [FK_dbo.smsTeachers_dbo.smsCountries_CountryID]
GO
ALTER TABLE [dbo].[smsTeachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTeachers_dbo.smsSchools_SchoolID] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[smsSchools] ([SchoolID])
GO
ALTER TABLE [dbo].[smsTeachers] CHECK CONSTRAINT [FK_dbo.smsTeachers_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsTeachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTeachers_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
GO
ALTER TABLE [dbo].[smsTeachers] CHECK CONSTRAINT [FK_dbo.smsTeachers_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsTimeTables]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsClasses_ClassID] FOREIGN KEY([ClassID])
REFERENCES [dbo].[smsClasses] ([ClassID])
GO
ALTER TABLE [dbo].[smsTimeTables] CHECK CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsClasses_ClassID]
GO
ALTER TABLE [dbo].[smsTimeTables]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsEmployees_Employee_EmployeeID] FOREIGN KEY([Employee_EmployeeID])
REFERENCES [dbo].[smsEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[smsTimeTables] CHECK CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsEmployees_Employee_EmployeeID]
GO
ALTER TABLE [dbo].[smsTimeTables]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsPeriods_PeriodID] FOREIGN KEY([PeriodID])
REFERENCES [dbo].[smsPeriods] ([PeriodID])
GO
ALTER TABLE [dbo].[smsTimeTables] CHECK CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsPeriods_PeriodID]
GO
ALTER TABLE [dbo].[smsTimeTables]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsSchools_SchoolID] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[smsSchools] ([SchoolID])
GO
ALTER TABLE [dbo].[smsTimeTables] CHECK CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsSchools_SchoolID]
GO
ALTER TABLE [dbo].[smsTimeTables]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsSections_SectionID] FOREIGN KEY([SectionID])
REFERENCES [dbo].[smsSections] ([SectionID])
GO
ALTER TABLE [dbo].[smsTimeTables] CHECK CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsSections_SectionID]
GO
ALTER TABLE [dbo].[smsTimeTables]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsSubjects_SubjectID] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[smsSubjects] ([SubjectID])
GO
ALTER TABLE [dbo].[smsTimeTables] CHECK CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsSubjects_SubjectID]
GO
ALTER TABLE [dbo].[smsTimeTables]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsTeachers_TeacherID] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[smsTeachers] ([TeacherID])
GO
ALTER TABLE [dbo].[smsTimeTables] CHECK CONSTRAINT [FK_dbo.smsTimeTables_dbo.smsTeachers_TeacherID]
GO
ALTER TABLE [dbo].[smsTopics]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsTopics_dbo.smsChapters_ChapterID] FOREIGN KEY([ChapterID])
REFERENCES [dbo].[smsChapters] ([ChapterID])
GO
ALTER TABLE [dbo].[smsTopics] CHECK CONSTRAINT [FK_dbo.smsTopics_dbo.smsChapters_ChapterID]
GO
ALTER TABLE [dbo].[smsUserPagePermissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsUserPagePermissions_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
GO
ALTER TABLE [dbo].[smsUserPagePermissions] CHECK CONSTRAINT [FK_dbo.smsUserPagePermissions_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsUserRoles_dbo.smsRoles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[smsRoles] ([RoleID])
GO
ALTER TABLE [dbo].[smsUserRoles] CHECK CONSTRAINT [FK_dbo.smsUserRoles_dbo.smsRoles_RoleID]
GO
ALTER TABLE [dbo].[smsUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsUserRoles_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
GO
ALTER TABLE [dbo].[smsUserRoles] CHECK CONSTRAINT [FK_dbo.smsUserRoles_dbo.smsUsers_UserID]
GO
ALTER TABLE [dbo].[smsVideos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.smsVideos_dbo.smsUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[smsUsers] ([UserID])
GO
ALTER TABLE [dbo].[smsVideos] CHECK CONSTRAINT [FK_dbo.smsVideos_dbo.smsUsers_UserID]
GO

