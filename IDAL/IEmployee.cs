using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace IDAL
{
  public  interface IEmployee
    {
        bool Insert(EmployeeRequestModel model);

        bool Update(EmployeeRequestModel model);

        List<EmployeeResponseModel> GetALL();

        List<EmployeeRequestModel> GetALLSkills();

        EmployeeResponseModel GetByID(int ID);

        bool Delete(int ID);
    }
}
