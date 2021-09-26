using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;
using DBUtility;
using IDAL;
namespace DAL
{
   public class DepartmentDAL:IDepartment
    {
        DBHelper db = new DBHelper();
        public List<DepartmentModel> GetALL()
        {
            List<DepartmentModel> lst = new List<DepartmentModel>();
            db = new DBUtility.DBHelper();
            DataTable dt = new DataTable();
            dt = db.GetTable("dep_select");
            foreach (System.Data.DataRow dr in dt.Rows)
            {
                DepartmentModel model = new DepartmentModel();
                model.CODE = dr["CODE"].ToString();
                model.DESCRIPTION = dr["DESCRIPTION"].ToString();                           
                lst.Add(model);
            }
            return lst;
        }
    }
}
