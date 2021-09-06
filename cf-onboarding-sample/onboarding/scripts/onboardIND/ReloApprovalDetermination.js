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

var reloInfo = $.context.equipment.RelocationInfo;
var relototal = 0;
var relototalInfo = [];
var relototequip = {};

if(reloInfo.length > 0) {
    for (var i = 0; i < reloInfo.length; i++) {
        relototequip = reloInfo[i];
        relototal = relototal + relototequip.Price;
        relototalInfo.push(relototequip);
    }
} else {
    relototequip = reloInfo;
    relototal = relototal + relototequip.Price;
    RelosInfo.push(relototequip);
}

$.context.equipment.Relototal = relototal;

var Vocabularyrelo = [{
    "TotalEquipmentAmount": {
        "TotalAmount": relototal
    }
}];

var rulesPayloadrelototal = {
    "RuleServiceId": "5f6ead4ab3d24ec29d744890a9cf58a9",
    "Vocabulary": Vocabularyrelo
};

$.context.rulesPayloadrelototal = rulesPayloadrelototal;