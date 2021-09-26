using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Model;
namespace EmployeeProj.Controllers
{
    public class EmployeeController : Controller
    {

        //public DBContext.EmployeeContext db = new DBContext.EmployeeContext();
        // GET: Employee
        private static List<SelectListItem> PopulateDepartment()
        {
           BLL.DepartmentBLL bll = new DepartmentBLL();
            List<DepartmentModel> lst = new List<DepartmentModel>();
            lst = bll.GetALL();
            List<SelectListItem> items = new List<SelectListItem>();
            foreach (DepartmentModel m in lst)
                items.Add(new SelectListItem
                {
                    Text = m.DESCRIPTION,
                    Value = m.CODE
                });
            return items;
        }

        private static List<SelectListItem> PopulateSkills()
        {
            BLL.EmployeeBLL bll = new EmployeeBLL();
            List<EmployeeModel> lst = new List<EmployeeModel>();
            lst = bll.GetALLSkills();
            List<SelectListItem> skillitems = new List<SelectListItem>();        
            foreach (Model.EmployeeModel s in lst)
               skillitems.Add(new SelectListItem
                {
                    Text = s.Skillmodel.Skills,
                    Value = s.Skillmodel.Skills
               });           
            return skillitems;
            }       
      

        public ActionResult Index()
        {            
            ViewBag.lstDepartment = PopulateDepartment();          
            ViewBag.lstSkills = PopulateSkills();
            return View();
        }

        [HttpPost]
        public ActionResult Index(FormCollection form,EmployeeModel model)
        {
           
            string skillset = form["skill"];
            model.Skillmodel.Skills = skillset;
            BLL.EmployeeBLL bll = new EmployeeBLL();
            if (bll.Insert(model) == true)
            {
                return RedirectToAction("EmployeeList");
            }

            return View();
        }


        public ActionResult EmployeeList()
        {
            BLL.EmployeeBLL bll = new EmployeeBLL();
            List<EmployeeModel> lst = new List<EmployeeModel>();
            lst = bll.GetALL();
            return View(lst);
        }
    }
}