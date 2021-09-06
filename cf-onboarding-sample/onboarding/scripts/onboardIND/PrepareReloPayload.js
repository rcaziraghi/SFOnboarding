/*
// read from existing workflow context 
var productInfo = $.context.productInfo; 
var productName = productInfo.productName; 
var productDescription = productInfo.productDescription;

// read contextual information
var taskDefinitionId = $.info.taskDefinitionId;

// read user task information
var lastUserTask1 = $.usertasks.usertask1.last;
var userTaskSubject = lastUserTask1.subject;
var userTaskProcessor = lastUserTask1.processor;
var userTaskCompletedAt = lastUserTask1.completedAt;

var userTaskStatusMessage = " User task '" + userTaskSubject + "' has been completed by " + userTaskProcessor + " at " + userTaskCompletedAt;

// create new node 'product'
var product = {
		productDetails: productName  + " " + productDescription,
		workflowStep: taskDefinitionId
};

// write 'product' node to workflow context
$.context.product = product;
*/

var empData = $.context.CInfo.d;

var employeeRelo = {};

employeeRelo.countryOfCompany = $.context.response.countryCode;
employeeRelo.company = $.context.response.country;
employeeRelo.jobDepartment = empData.department;

var VocabularyReloEmp = [{
    "Employee": employeeRelo
}];

var rulesPayloadRelo = {
    "RuleServiceId": "26fce555ba8048c78f2d51a93ab886df",
    "Vocabulary": VocabularyReloEmp
};

$.context.rulesPayloadRelo = rulesPayloadRelo;
