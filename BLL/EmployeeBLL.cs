using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using IDAL;
using DAL;
namespace BLL
{
    public class EmployeeBLL
    {
        IEmployee iemployee = new DAL.EmployeeDAL();
        public bool Insert(EmployeeRequestModel model)
        {
            return iemployee.Insert(model);
                
        }


        public bool Update(EmployeeRequestModel model)
        {
            return iemployee.Update(model);

        }

        public List<EmployeeResponseModel> GetALL()
        {
            return iemployee.GetALL();
        }

        public List<EmployeeRequestModel> GetALLSkills()
        {
            return iemployee.GetALLSkills();
        }


        public EmployeeResponseModel GetByID(int ID)
        {
            return iemployee.GetByID(ID);
        }


        public bool Delete(int ID)
        {
            return iemployee.Delete(ID);
        }
    }
}
