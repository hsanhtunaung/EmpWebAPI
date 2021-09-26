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
   public class DepartmentBLL
    {
        IDepartment idepartment = new DAL.DepartmentDAL();
       

        public List<DepartmentModel> GetALL()
        {
            return idepartment.GetALL();
        }
    }
}
