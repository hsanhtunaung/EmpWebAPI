using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class EmployeeResponseModel
    {
        public int EMPLOYEE_ID { get; set; }
        public string EMPLOYEE_NAME { get; set; }
        public string EMPLOYEE_NO { get; set; }

        public DateTime DOB { get; set; }
        public DateTime JOIN_DATE { get; set; }
        public string DEPARTMENT { get; set; }
        public decimal SALARY { get; set; }
        public string SKILLS { get; set; }

    }
}
