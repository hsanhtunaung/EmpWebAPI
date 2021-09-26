using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Model;
using BLL;
using Newtonsoft.Json;

namespace WebAPI.Controllers
{
    public class EmployeeController : ApiController
    {
        // GET: api/Employee/Get
        [Route("API/Employee/Get")]       
        public IEnumerable<EmployeeResponseModel> Get()        
        {
            BLL.EmployeeBLL bll = new EmployeeBLL();
            List<EmployeeResponseModel> lst = new List<EmployeeResponseModel>();
            lst = bll.GetALL();
            return lst;
        }

        // GET api/Employee/Get?id=1
        [Route("API/Employee/Get")]      
        public EmployeeResponseModel Get(int id)
        {
            BLL.EmployeeBLL bll = new EmployeeBLL();
            EmployeeResponseModel model = new EmployeeResponseModel();
            model = bll.GetByID(id);
            return model;
        }

        [Route("API/Employee/Post")]
        [HttpPost]
        // POST: api/Employee
        public HttpResponseMessage Post([FromBody]EmployeeRequestModel value)
        {
            BLL.EmployeeBLL bll = new EmployeeBLL();
            EmployeeResponseModel response = new EmployeeResponseModel();
            if (bll.Insert(value) == true)
            {
                return Request.CreateResponse(HttpStatusCode.Created);
            }
            else 
            return Request.CreateResponse(HttpStatusCode.BadRequest);
        }

        // PUT: api/Employee/5
        [Route("API/Employee/Put")]
        [HttpPost]
        public HttpResponseMessage Put([FromBody] EmployeeRequestModel value)
        {
            BLL.EmployeeBLL bll = new EmployeeBLL();
            EmployeeResponseModel response = new EmployeeResponseModel();
            if (bll.Update(value) == true)
            {
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            else
                return Request.CreateResponse(HttpStatusCode.BadRequest);
        }

        // DELETE api/Employee/Delete?id=1
        [Route("API/Employee/Delete")]
        [HttpDelete]
        public HttpResponseMessage Delete(int id)
        {
            BLL.EmployeeBLL bll = new EmployeeBLL();
            EmployeeResponseModel response = new EmployeeResponseModel();
            if (bll.Delete(id) == true)
            {
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            else
                return Request.CreateResponse(HttpStatusCode.BadRequest);
        }
    }
}
