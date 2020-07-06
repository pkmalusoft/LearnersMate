﻿using learnersmate.Models;
using System.Collections.Generic;

namespace learnersmate.Repository
{
    public interface IRegisterCompany
    {
        IEnumerable<RegisterCompany> ListofCompanies(int UserID);
        void Add(RegisterCompany entity);
        void Delete(RegisterCompany entity);
        RegisterCompany FindCompanyByUserId(int UserID);
        bool ValidateCompanyName(RegisterCompany registercompany);
        bool CheckIsCompanyRegistered(int UserID);
    }
}
