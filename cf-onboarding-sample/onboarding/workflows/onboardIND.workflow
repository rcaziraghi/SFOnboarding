{
	"contents": {
		"dd262983-0d98-4273-8573-96fc70238d26": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "onboardind",
			"subject": "onboardIND",
			"name": "onboardIND",
			"documentation": "onboardIND",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"a8a0548b-a58a-4923-b3ba-e92c4a3ea658": {
					"name": "PrepareReloPayload"
				},
				"472f0051-891c-4623-a508-f78979b2449d": {
					"name": "Relo Determination"
				},
				"0eb1031f-207f-42d4-9af9-2e033be75748": {
					"name": "Retrieve Relocation list"
				},
				"cfca7ed5-1965-4621-88bb-42e66fd7afb8": {
					"name": "Change or Confirm Relocation Entitlements"
				},
				"720e7e12-96eb-4c8f-9b42-7a363ee9257d": {
					"name": "Approval Determination"
				},
				"845fae86-23fb-49b1-95f5-ff3d4bb1ef7c": {
					"name": "Determine if Relo is approved"
				},
				"2b3fe506-f9e8-4ed7-bbc2-caef4eade0fb": {
					"name": "Need Approval"
				},
				"21e5715d-9301-4ccc-a811-1de62263e735": {
					"name": "Approve Relocation Entitlements"
				},
				"5b382442-24ef-48db-aca7-09dc9b7c5e6e": {
					"name": "Is approved"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"f87c45db-18eb-47e7-9e35-f326a1d28697": {
					"name": "SequenceFlow2"
				},
				"b836cea7-c536-4ce9-bcc7-c10fda8f205a": {
					"name": "SequenceFlow3"
				},
				"1b905aad-6a0a-4926-9fe2-e096abe6ff92": {
					"name": "SequenceFlow4"
				},
				"e4e9c51f-6723-4541-95ca-ff7dffa03cd0": {
					"name": "SequenceFlow5"
				},
				"ab5a91a1-4dec-4af5-b770-f1c711a609a0": {
					"name": "SequenceFlow6"
				},
				"086a5850-f606-46df-8063-cc3563657621": {
					"name": "SequenceFlow7"
				},
				"c2bb3803-aa7e-45db-b137-d98b69d35c09": {
					"name": "SequenceFlow9"
				},
				"557fb5b1-d8dc-4f45-8c58-943162fc7c4b": {
					"name": "Needs Approval"
				},
				"b840f765-2c2c-47b2-99d3-450d801d9ec9": {
					"name": "Approved"
				},
				"de02c9a6-7958-4e8d-a9ca-63a4dd9c1638": {
					"name": "Rejected"
				},
				"05cf31d8-dfa3-4229-acc6-988afa3a6e58": {
					"name": "auto approved"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"a8a0548b-a58a-4923-b3ba-e92c4a3ea658": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/onboardIND/PrepareReloPayload.js",
			"id": "scripttask1",
			"name": "PrepareReloPayload"
		},
		"472f0051-891c-4623-a508-f78979b2449d": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v2/workingset-rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.rulesPayloadRelo}",
			"responseVariable": "${context.equipment.ReloInfo}",
			"id": "servicetask1",
			"name": "Relo Determination"
		},
		"0eb1031f-207f-42d4-9af9-2e033be75748": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/onboardIND/Relocation List.js",
			"id": "scripttask2",
			"name": "Retrieve Relocation list"
		},
		"cfca7ed5-1965-4621-88bb-42e66fd7afb8": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Confirm or Change relocation entitlements for ${context.CInfo.d.results[0].fName} ${context.CInfo.d.results[0].lName}",
			"description": "Review and update relocation entitlements",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/onboardIND/ConfirmOrChangeRelo.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "confirmorchangerelo"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask1",
			"name": "Change or Confirm Relocation Entitlements"
		},
		"720e7e12-96eb-4c8f-9b42-7a363ee9257d": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/onboardIND/ReloApprovalDetermination.js",
			"id": "scripttask3",
			"name": "Approval Determination"
		},
		"845fae86-23fb-49b1-95f5-ff3d4bb1ef7c": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v2/workingset-rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.rulesPayloadrelototal}",
			"responseVariable": "${context.response.reloApprove}",
			"id": "servicetask2",
			"name": "Determine if Relo is approved"
		},
		"2b3fe506-f9e8-4ed7-bbc2-caef4eade0fb": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Need Approval",
			"default": "05cf31d8-dfa3-4229-acc6-988afa3a6e58"
		},
		"21e5715d-9301-4ccc-a811-1de62263e735": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve relocation entitlements for ${context.CInfo.d.results[0].fName} ${context.CInfo.d.results[0].lName}",
			"description": "Review and approve Relocation Entitlements",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/onboardIND/ApproveRelo.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approverelo"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask2",
			"name": "Approve Relocation Entitlements"
		},
		"5b382442-24ef-48db-aca7-09dc9b7c5e6e": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "Is approved",
			"default": "b840f765-2c2c-47b2-99d3-450d801d9ec9"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "a8a0548b-a58a-4923-b3ba-e92c4a3ea658"
		},
		"f87c45db-18eb-47e7-9e35-f326a1d28697": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "a8a0548b-a58a-4923-b3ba-e92c4a3ea658",
			"targetRef": "472f0051-891c-4623-a508-f78979b2449d"
		},
		"b836cea7-c536-4ce9-bcc7-c10fda8f205a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "472f0051-891c-4623-a508-f78979b2449d",
			"targetRef": "0eb1031f-207f-42d4-9af9-2e033be75748"
		},
		"1b905aad-6a0a-4926-9fe2-e096abe6ff92": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "0eb1031f-207f-42d4-9af9-2e033be75748",
			"targetRef": "cfca7ed5-1965-4621-88bb-42e66fd7afb8"
		},
		"e4e9c51f-6723-4541-95ca-ff7dffa03cd0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "cfca7ed5-1965-4621-88bb-42e66fd7afb8",
			"targetRef": "720e7e12-96eb-4c8f-9b42-7a363ee9257d"
		},
		"ab5a91a1-4dec-4af5-b770-f1c711a609a0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "720e7e12-96eb-4c8f-9b42-7a363ee9257d",
			"targetRef": "845fae86-23fb-49b1-95f5-ff3d4bb1ef7c"
		},
		"086a5850-f606-46df-8063-cc3563657621": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "845fae86-23fb-49b1-95f5-ff3d4bb1ef7c",
			"targetRef": "2b3fe506-f9e8-4ed7-bbc2-caef4eade0fb"
		},
		"c2bb3803-aa7e-45db-b137-d98b69d35c09": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "21e5715d-9301-4ccc-a811-1de62263e735",
			"targetRef": "5b382442-24ef-48db-aca7-09dc9b7c5e6e"
		},
		"557fb5b1-d8dc-4f45-8c58-943162fc7c4b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.response.reloApprove.Result[0].RelocationApproval.Approvalneeded=='true'}",
			"id": "sequenceflow16",
			"name": "Needs Approval",
			"sourceRef": "2b3fe506-f9e8-4ed7-bbc2-caef4eade0fb",
			"targetRef": "21e5715d-9301-4ccc-a811-1de62263e735"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"ee1d0c3c-6841-4846-897e-896eeacdcf7d": {},
				"ee75a2a6-779e-4e83-b7b5-86ae972b9c26": {},
				"5a6c6d8c-95fd-4971-92f5-43b69fdcde7a": {},
				"39002a45-f8ce-4769-800d-0b934ad1bb10": {},
				"f38bb900-b5c7-4223-9a56-5dfba57f7994": {},
				"053f3277-0641-4fbf-ba40-58ed24602c3e": {},
				"072b28b6-cba4-45af-996d-7a3be0eab99b": {},
				"4462216a-0ea2-4b87-ae1c-c258f94215e1": {},
				"46cf0844-48f6-4b88-8beb-f633e28e9e2c": {},
				"e96e2389-9bd0-409b-b481-f1be2ade47c4": {},
				"fc562140-69b6-4ded-9ffc-af6a9370b8d3": {},
				"5a0f7484-8577-4da9-80f3-06df58d38e77": {},
				"54752e51-58ef-4c47-99bd-ebd1a1b347d8": {},
				"260f9b03-9cd6-4874-acb2-e3b835c11eef": {},
				"d7247511-2b54-4272-9fdc-0069f8184a4d": {},
				"a9a4fdea-d443-4eb1-82bc-d6d31eb88b8c": {},
				"11fbc4e1-0001-4cec-a7c2-2bbf46470faf": {},
				"f22dee00-e042-4c26-8b56-446c1c0926b6": {},
				"335dd33f-1d50-4f62-b962-76ebb36d20db": {},
				"b81be9ff-6fd5-41f0-a8fa-cb8994f4aab3": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 100,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1676,
			"y": 94,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,116 251,116",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "ee1d0c3c-6841-4846-897e-896eeacdcf7d",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"ee1d0c3c-6841-4846-897e-896eeacdcf7d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 201,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "a8a0548b-a58a-4923-b3ba-e92c4a3ea658"
		},
		"ee75a2a6-779e-4e83-b7b5-86ae972b9c26": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "251,116 413,116",
			"sourceSymbol": "ee1d0c3c-6841-4846-897e-896eeacdcf7d",
			"targetSymbol": "5a6c6d8c-95fd-4971-92f5-43b69fdcde7a",
			"object": "f87c45db-18eb-47e7-9e35-f326a1d28697"
		},
		"5a6c6d8c-95fd-4971-92f5-43b69fdcde7a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 363,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "472f0051-891c-4623-a508-f78979b2449d"
		},
		"39002a45-f8ce-4769-800d-0b934ad1bb10": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "413,116 566,116",
			"sourceSymbol": "5a6c6d8c-95fd-4971-92f5-43b69fdcde7a",
			"targetSymbol": "f38bb900-b5c7-4223-9a56-5dfba57f7994",
			"object": "b836cea7-c536-4ce9-bcc7-c10fda8f205a"
		},
		"f38bb900-b5c7-4223-9a56-5dfba57f7994": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 516,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "0eb1031f-207f-42d4-9af9-2e033be75748"
		},
		"053f3277-0641-4fbf-ba40-58ed24602c3e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "566,116 721,116",
			"sourceSymbol": "f38bb900-b5c7-4223-9a56-5dfba57f7994",
			"targetSymbol": "072b28b6-cba4-45af-996d-7a3be0eab99b",
			"object": "1b905aad-6a0a-4926-9fe2-e096abe6ff92"
		},
		"072b28b6-cba4-45af-996d-7a3be0eab99b": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 671,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "cfca7ed5-1965-4621-88bb-42e66fd7afb8"
		},
		"4462216a-0ea2-4b87-ae1c-c258f94215e1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "721,116 884,116",
			"sourceSymbol": "072b28b6-cba4-45af-996d-7a3be0eab99b",
			"targetSymbol": "46cf0844-48f6-4b88-8beb-f633e28e9e2c",
			"object": "e4e9c51f-6723-4541-95ca-ff7dffa03cd0"
		},
		"46cf0844-48f6-4b88-8beb-f633e28e9e2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 834,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "720e7e12-96eb-4c8f-9b42-7a363ee9257d"
		},
		"e96e2389-9bd0-409b-b481-f1be2ade47c4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "884,116 1037,116",
			"sourceSymbol": "46cf0844-48f6-4b88-8beb-f633e28e9e2c",
			"targetSymbol": "fc562140-69b6-4ded-9ffc-af6a9370b8d3",
			"object": "ab5a91a1-4dec-4af5-b770-f1c711a609a0"
		},
		"fc562140-69b6-4ded-9ffc-af6a9370b8d3": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 987,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "845fae86-23fb-49b1-95f5-ff3d4bb1ef7c"
		},
		"5a0f7484-8577-4da9-80f3-06df58d38e77": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1037,115.5 1162,115.5",
			"sourceSymbol": "fc562140-69b6-4ded-9ffc-af6a9370b8d3",
			"targetSymbol": "54752e51-58ef-4c47-99bd-ebd1a1b347d8",
			"object": "086a5850-f606-46df-8063-cc3563657621"
		},
		"54752e51-58ef-4c47-99bd-ebd1a1b347d8": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1141,
			"y": 94,
			"object": "2b3fe506-f9e8-4ed7-bbc2-caef4eade0fb"
		},
		"260f9b03-9cd6-4874-acb2-e3b835c11eef": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1283,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "21e5715d-9301-4ccc-a811-1de62263e735"
		},
		"d7247511-2b54-4272-9fdc-0069f8184a4d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1333,115.5 1468,115.5",
			"sourceSymbol": "260f9b03-9cd6-4874-acb2-e3b835c11eef",
			"targetSymbol": "a9a4fdea-d443-4eb1-82bc-d6d31eb88b8c",
			"object": "c2bb3803-aa7e-45db-b137-d98b69d35c09"
		},
		"a9a4fdea-d443-4eb1-82bc-d6d31eb88b8c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1447,
			"y": 94,
			"object": "5b382442-24ef-48db-aca7-09dc9b7c5e6e"
		},
		"11fbc4e1-0001-4cec-a7c2-2bbf46470faf": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1162,115.5 1333,115.5",
			"sourceSymbol": "54752e51-58ef-4c47-99bd-ebd1a1b347d8",
			"targetSymbol": "260f9b03-9cd6-4874-acb2-e3b835c11eef",
			"object": "557fb5b1-d8dc-4f45-8c58-943162fc7c4b"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 21,
			"startevent": 1,
			"endevent": 2,
			"usertask": 2,
			"servicetask": 2,
			"scripttask": 3,
			"exclusivegateway": 2
		},
		"b840f765-2c2c-47b2-99d3-450d801d9ec9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow19",
			"name": "Approved",
			"sourceRef": "5b382442-24ef-48db-aca7-09dc9b7c5e6e",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"f22dee00-e042-4c26-8b56-446c1c0926b6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1468,113.25 1693.5,113.25",
			"sourceSymbol": "a9a4fdea-d443-4eb1-82bc-d6d31eb88b8c",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "b840f765-2c2c-47b2-99d3-450d801d9ec9"
		},
		"de02c9a6-7958-4e8d-a9ca-63a4dd9c1638": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask2.last.decision==\"reject\"}",
			"id": "sequenceflow20",
			"name": "Rejected",
			"sourceRef": "5b382442-24ef-48db-aca7-09dc9b7c5e6e",
			"targetRef": "cfca7ed5-1965-4621-88bb-42e66fd7afb8"
		},
		"335dd33f-1d50-4f62-b962-76ebb36d20db": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1468,115.5 1468,12 721,12 721,115.5",
			"sourceSymbol": "a9a4fdea-d443-4eb1-82bc-d6d31eb88b8c",
			"targetSymbol": "072b28b6-cba4-45af-996d-7a3be0eab99b",
			"object": "de02c9a6-7958-4e8d-a9ca-63a4dd9c1638"
		},
		"05cf31d8-dfa3-4229-acc6-988afa3a6e58": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow21",
			"name": "auto approved",
			"sourceRef": "2b3fe506-f9e8-4ed7-bbc2-caef4eade0fb",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"b81be9ff-6fd5-41f0-a8fa-cb8994f4aab3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1162,113.25 1162,237 1693.5,237 1693.5,113.25",
			"sourceSymbol": "54752e51-58ef-4c47-99bd-ebd1a1b347d8",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "05cf31d8-dfa3-4229-acc6-988afa3a6e58"
		}
	}
}