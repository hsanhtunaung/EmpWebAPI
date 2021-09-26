using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using IDAL;
using DBUtility;
using System.Data;
namespace DAL
{
    public class EmployeeDAL: IEmployee
    {
        DBHelper db = new DBHelper();
        public bool Insert(EmployeeRequestModel model)
        {
            db = new DBUtility.DBHelper();

            db.AddParaInput("@EMPLOYEE_NO", model.EMPLOYEE_NO, SqlDbType.NVarChar);
            db.AddParaInput("@EMPLOYEE_NAME", model.EMPLOYEE_NAME, SqlDbType.NVarChar);
            db.AddParaInput("@DOB", model.DOB, SqlDbType.DateTime);
            db.AddParaInput("@JOIN_DATE", model.JOIN_DATE, SqlDbType.DateTime);
            db.AddParaInput("@DEPARTMENT", model.DEPARTMENT, SqlDbType.NVarChar);
            db.AddParaInput("@SALARY", model.SALARY, SqlDbType.Decimal);           
            db.AddParaInput("@SKILLS", model.SKILLS, SqlDbType.NVarChar);
            if (db.Exec("[emp_insert]") > 0)
            {
                return true;
            }
            return false;
        }


        public List<EmployeeResponseModel> GetALL()
        {
            List<EmployeeResponseModel> lst = new List<EmployeeResponseModel>();
            db = new DBUtility.DBHelper();
            DataTable dt = new DataTable();
            dt = db.GetTable("[emp_select]");
            foreach (DataRow dr in dt.Rows)
            {
                EmployeeResponseModel model = new EmployeeResponseModel();
                model.EMPLOYEE_ID = Convert.ToInt32(dr["EMPLOYEE_ID"].ToString());
                model.EMPLOYEE_NO = dr["EMPLOYEE_NO"].ToString();
                model.EMPLOYEE_NAME = dr["EMPLOYEE_NAME"].ToString();
                model.DOB = Convert.ToDateTime(dr["DOB"].ToString());
                model.JOIN_DATE = Convert.ToDateTime(dr["JOIN_DATE"].ToString());
                model.DEPARTMENT = dr["DEPARTMENT"].ToString();
                model.SALARY = Convert.ToDecimal(dr["SALARY"].ToString());
                model.SKILLS = dr["SKILLS"].ToString();
                lst.Add(model);
            }
            return lst;
        }

        public List<EmployeeRequestModel> GetALLSkills()
        {
            List<EmployeeRequestModel> lst = new List<EmployeeRequestModel>();
            db = new DBUtility.DBHelper();
            DataTable dt = new DataTable();
            dt = db.GetTable("[get_Skill]");
            foreach (DataRow dr in dt.Rows)
            {
                EmployeeRequestModel model = new EmployeeRequestModel();
                model.Skillmodel.Skills = dr["Skills"].ToString();               
                lst.Add(model);
            }
            return lst;
        }


        public bool Update(EmployeeRequestModel model)
        {
            db = new DBUtility.DBHelper();
            db.AddParaInput("@EMPLOYEE_ID", model.EMPLOYEE_ID, SqlDbType.Int);
            db.AddParaInput("@EMPLOYEE_NO", model.EMPLOYEE_NO, SqlDbType.NVarChar);
            db.AddParaInput("@EMPLOYEE_NAME", model.EMPLOYEE_NAME, SqlDbType.NVarChar);
            db.AddParaInput("@DOB", model.DOB, SqlDbType.DateTime);
            db.AddParaInput("@JOIN_DATE", model.JOIN_DATE, SqlDbType.DateTime);
            db.AddParaInput("@DEPARTMENT", model.DEPARTMENT, SqlDbType.NVarChar);
            db.AddParaInput("@SALARY", model.SALARY, SqlDbType.Decimal);
            db.AddParaInput("@SKILLS", model.SKILLS, SqlDbType.NVarChar);
            db.AddParaInput("@UPDATED_DATE", DateTime.Now, SqlDbType.DateTime);
            if (db.Exec("[emp_update]") > 0)
            {
                return true;
            }
            return false;
        }

      public EmployeeResponseModel GetByID(int ID)
        {
            EmployeeResponseModel model = new EmployeeResponseModel();
            db = new DBUtility.DBHelper();
            DataTable dt = new DataTable();
            db.AddParaInput("@EMPLOYEE_ID", ID, SqlDbType.Int);
            dt = db.GetTable("[emp_selectbyempid]");
            foreach (DataRow dr in dt.Rows)
            {
              
                model.EMPLOYEE_ID = Convert.ToInt32(dr["EMPLOYEE_ID"].ToString());
                model.EMPLOYEE_NO = dr["EMPLOYEE_NO"].ToString();
                model.EMPLOYEE_NAME = dr["EMPLOYEE_NAME"].ToString();
                model.DOB = Convert.ToDateTime(dr["DOB"].ToString());
                model.JOIN_DATE = Convert.ToDateTime(dr["JOIN_DATE"].ToString());
                model.DEPARTMENT = dr["DEPARTMENT"].ToString();
                model.SALARY = Convert.ToDecimal(dr["SALARY"].ToString());
                model.SKILLS = dr["SKILLS"].ToString();               
            }
            return model;
        }

        public bool Delete(int ID)
        {
            db = new DBUtility.DBHelper();

            db.AddParaInput("@EMPLOYEE_ID", ID, SqlDbType.Int);
            if (db.Exec("[emp_delete]") > 0)
            {
                return true;
            }
            return false;
        }
    }
}
