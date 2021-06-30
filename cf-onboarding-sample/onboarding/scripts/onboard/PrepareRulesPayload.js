  /*var empJob = $.context.empData.d.results[0].empInfo.jobInfoNav.results[0];*/
var empData = $.context.CInfo.d.results[0];

  /************ Prepare Input Payload to Execute Rules ****************/

 
    var employee = {};
     employee.countryOfCompany = empData.workCountry;
     //employee.company = "1710";
     employee.company = "ACE_USA";
     //employee.jobCode = empData.jobCode;
     employee.jobDepartment = empData.department;
    

    var Vocabulary = [{
  	 "Employee": employee
    }];
    var rulesPayload = {
    	"RuleServiceId": "6bbd196d50c14b918d04c181e78d3a5b",
    	//"RuleServiceVersion": "000002000007000000",
    	"Vocabulary": Vocabulary
    };
  $.context.rulesPayload = rulesPayload;
  
  /************ Enhance Workflow Context for additional attributes ****************/
  var attributes = {
  	username: empData.fName + " " + empData.lName,
  	division: empData.division,
  	city: empData.location,
  	country: empData.workCountry,
  	jobDepartment: empData.department,

  };
  //$.context.empData.personalInfo = attributes;