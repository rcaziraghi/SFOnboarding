    var empData = $.context.CInfo.d.results[0];
    var empCompany = $.context.response.country;
  /************ Prepare Input Payload to Execute Rules ****************/

  //$.context.empData = empData
 
    var employee = {};
     employee.countryOfCompany = empData.workCountry;
     employee.company = $.context.response.country;
     employee.jobDepartment = empData.department;
    

    var VocabularyEmp = [{
  	 "Employee": employee
    }];
    var rulesPayload = {
    	"RuleServiceId": "6bbd196d50c14b918d04c181e78d3a5b",
    	//"RuleServiceVersion": "000002000007000000",
    	"Vocabulary": VocabularyEmp
    };
  $.context.rulesPayload = rulesPayload;
  
  /************ Enhance Workflow Context for additional attributes ****************/
 /*var attributes = {
  	username: empData.fName + " " + empData.lName,
  	division: empData.division,
  	city: empData.location,
  	country: empData.workCountry,
  	jobDepartment: empData.department,

  };
  $.context.empData.personalInfo = attributes;*/