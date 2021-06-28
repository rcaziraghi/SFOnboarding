{
	"contents": {
		"72f53f11-cef3-46ba-aa5e-e56634fe7c76": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "onboard",
			"subject": "Onboarding ${context.userId}",
			"businessKey": "${context.userId}",
			"customAttributes": [{
				"id": "jobTitle",
				"label": "Job Title",
				"type": "string",
				"value": "${context.empData.personalInfo.jobTitle}"
			}, {
				"id": "country",
				"label": "Country",
				"type": "string",
				"value": "${context.empData.personalInfo.country}"
			}, {
				"id": "division",
				"label": "Division",
				"type": "string",
				"value": "${context.empData.personalInfo.division}"
			}, {
				"id": "username",
				"label": "User Name",
				"type": "string",
				"value": "${context.empData.personalInfo.username}"
			}],
			"name": "onboard",
			"documentation": "",
			"lastIds": "600eee18-fc10-4576-982b-74d08fbcb62e",
			"events": {
				"5f136fac-3aee-4c23-b9e4-5e4b837f3a16": {
					"name": "StartEvent1"
				},
				"b919de38-e160-4e57-8331-f1ee1aecd6f1": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"279de180-6739-4615-b4b4-254005ef4f2b": {
					"name": "Change or Confirm Equipment"
				},
				"c3176c60-9c77-43ef-8273-dd6b919ff1db": {
					"name": "Approve Equipment"
				},
				"8d59f760-8a8b-45cd-9591-2d05d71d7d12": {
					"name": "Accept workplace for new hire"
				},
				"7ba66efa-4d2e-47ff-bb5e-86e58b871488": {
					"name": "Prepare Rules Payload"
				},
				"f9cf3524-7ac5-4f1e-8b34-509537875729": {
					"name": "Determine Equipment"
				},
				"fb3c8397-77da-427d-97ef-a19aad769c03": {
					"name": "Enrich Context"
				},
				"ef91a235-aa2c-42f8-9b1a-c3799343ac52": {
					"name": "Retrieve Input"
				},
				"2b0a62dc-4b45-4b63-a97b-2f860bcce996": {
					"name": "Collect Input"
				}
			},
			"gateways": {
				"a994f5eb-0a71-4d2c-bc67-94bde11a4052": {
					"name": "IsApproved"
				}
			},
			"sequenceFlows": {
				"0dc3be2e-8747-4908-869b-316b9f750d03": {
					"name": "Approved"
				},
				"f1073489-0fa7-499d-a170-da7040951ceb": {
					"name": "SequenceFlow16"
				},
				"57248737-d91c-4ab8-9c05-3fabb339baf4": {
					"name": "SequenceFlow42"
				},
				"86fd05ec-18d8-425c-bbf3-70aadf993806": {
					"name": "SequenceFlow51"
				},
				"0a02caf5-b4ab-4386-b05b-291b60cbae8d": {
					"name": "SequenceFlow52"
				},
				"fdb9cc90-b782-41d6-abb2-db190074bd9b": {
					"name": "SequenceFlow53"
				},
				"d6464a58-4838-482e-8ddb-20f95e78e551": {
					"name": "SequenceFlow55"
				},
				"a8b03abe-f2b3-4b30-bac6-91b4791c3ce8": {
					"name": "SequenceFlow56"
				},
				"9c8e97e3-3749-4c31-b9aa-fcb7adbba772": {
					"name": "Rejected"
				},
				"8cde9675-e8ac-4379-92f3-5cc90bca0e11": {
					"name": "SequenceFlow58"
				},
				"1ca6abcf-349c-4e32-9222-1a6375bd4a8b": {
					"name": "SequenceFlow61"
				}
			},
			"diagrams": {
				"4ab8548a-fd15-4d6b-af74-84067a3c82b0": {}
			}
		},
		"5f136fac-3aee-4c23-b9e4-5e4b837f3a16": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"8cbbcb83-667c-411f-9e37-be6006d3e622": {}
			}
		},
		"b919de38-e160-4e57-8331-f1ee1aecd6f1": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"279de180-6739-4615-b4b4-254005ef4f2b": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Confirm or Change Equipment for ${context.CInfo.d.results[0].fName} ${context.CInfo.d.results[0].lName}",
			"description": "The buddy assigns appropriate equipment to the new hire",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": " ${info.startedBy}",
			"formReference": "/forms/ConfirmOrChangeEquipment.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "ConfirmOrChangeEquipment"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "Change or Confirm Equipment",
			"documentation": "The buddy identifies the list of equipments which the new hire would need, considering the available inventory and profile of the new hire. "
		},
		"c3176c60-9c77-43ef-8273-dd6b919ff1db": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve Equipment for ${context.CInfo.d.results[0].fName} ${context.CInfo.d.results[0].lName}",
			"description": "The manager approves the equipment list proposed by the buddy",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/ApproveEquipment.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "ApproveEquipment"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask2",
			"name": "Approve Equipment",
			"documentation": "The manager approves the equipment list proposed by the buddy"
		},
		"8d59f760-8a8b-45cd-9591-2d05d71d7d12": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Accept Workplace for ${context.CInfo.d.results[0].fName} ${context.CInfo.d.results[0].lName}",
			"description": "The buddy should confirm that the workplace & equipments are ready before the new hire joins the organization.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/AcceptWorkplace.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "AcceptWorkplace"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask3",
			"name": "Accept workplace for new hire",
			"documentation": "Confirm that all equipment for the new hire is ready and accept the workplace setup"
		},
		"7ba66efa-4d2e-47ff-bb5e-86e58b871488": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/onboard/PrepareRulesPayload.js",
			"id": "scripttask3",
			"name": "Prepare Rules Payload",
			"documentation": "Identify the required equipment like laptop, mobile to onboarding employee"
		},
		"f9cf3524-7ac5-4f1e-8b34-509537875729": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v2/workingset-rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.rulesPayload}",
			"responseVariable": "${context.equipment.EquipmentsInfo}",
			"id": "servicetask7",
			"name": "Determine Equipment",
			"documentation": "Call business rules service to provide a list of equipment based on the new hire role, designation and country."
		},
		"fb3c8397-77da-427d-97ef-a19aad769c03": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/onboard/EnrichContext.js",
			"id": "scripttask6",
			"name": "Enrich Context"
		},
		"ef91a235-aa2c-42f8-9b1a-c3799343ac52": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SFSF_Demo_2",
			"path": "/odata/v2/OnboardingCandidateInfo?$filter=candidateId eq ${context.response.CanID}",
			"httpMethod": "GET",
			"responseVariable": "${context.CInfo}",
			"id": "servicetask8",
			"name": "Retrieve Input"
		},
		"2b0a62dc-4b45-4b63-a97b-2f860bcce996": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Input Candidate ID",
			"description": "Input the new candidate ID for onboarding process.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/InputCollection.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "InputCollection"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask5",
			"name": "Collect Input"
		},
		"a994f5eb-0a71-4d2c-bc67-94bde11a4052": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "IsApproved",
			"default": "0dc3be2e-8747-4908-869b-316b9f750d03"
		},
		"0dc3be2e-8747-4908-869b-316b9f750d03": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "Approved",
			"sourceRef": "a994f5eb-0a71-4d2c-bc67-94bde11a4052",
			"targetRef": "8d59f760-8a8b-45cd-9591-2d05d71d7d12"
		},
		"f1073489-0fa7-499d-a170-da7040951ceb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow16",
			"name": "SequenceFlow16",
			"sourceRef": "8d59f760-8a8b-45cd-9591-2d05d71d7d12",
			"targetRef": "b919de38-e160-4e57-8331-f1ee1aecd6f1"
		},
		"57248737-d91c-4ab8-9c05-3fabb339baf4": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow42",
			"name": "SequenceFlow42",
			"sourceRef": "279de180-6739-4615-b4b4-254005ef4f2b",
			"targetRef": "c3176c60-9c77-43ef-8273-dd6b919ff1db"
		},
		"86fd05ec-18d8-425c-bbf3-70aadf993806": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow51",
			"name": "SequenceFlow51",
			"sourceRef": "5f136fac-3aee-4c23-b9e4-5e4b837f3a16",
			"targetRef": "2b0a62dc-4b45-4b63-a97b-2f860bcce996"
		},
		"0a02caf5-b4ab-4386-b05b-291b60cbae8d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow52",
			"name": "SequenceFlow52",
			"sourceRef": "7ba66efa-4d2e-47ff-bb5e-86e58b871488",
			"targetRef": "f9cf3524-7ac5-4f1e-8b34-509537875729"
		},
		"fdb9cc90-b782-41d6-abb2-db190074bd9b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow53",
			"name": "SequenceFlow53",
			"sourceRef": "f9cf3524-7ac5-4f1e-8b34-509537875729",
			"targetRef": "fb3c8397-77da-427d-97ef-a19aad769c03"
		},
		"d6464a58-4838-482e-8ddb-20f95e78e551": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow55",
			"name": "SequenceFlow55",
			"sourceRef": "fb3c8397-77da-427d-97ef-a19aad769c03",
			"targetRef": "279de180-6739-4615-b4b4-254005ef4f2b"
		},
		"a8b03abe-f2b3-4b30-bac6-91b4791c3ce8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow56",
			"name": "SequenceFlow56",
			"sourceRef": "c3176c60-9c77-43ef-8273-dd6b919ff1db",
			"targetRef": "a994f5eb-0a71-4d2c-bc67-94bde11a4052"
		},
		"9c8e97e3-3749-4c31-b9aa-fcb7adbba772": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask2.last.decision==\"reject\"}",
			"id": "sequenceflow57",
			"name": "Rejected",
			"sourceRef": "a994f5eb-0a71-4d2c-bc67-94bde11a4052",
			"targetRef": "279de180-6739-4615-b4b4-254005ef4f2b"
		},
		"8cde9675-e8ac-4379-92f3-5cc90bca0e11": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow58",
			"name": "SequenceFlow58",
			"sourceRef": "ef91a235-aa2c-42f8-9b1a-c3799343ac52",
			"targetRef": "7ba66efa-4d2e-47ff-bb5e-86e58b871488"
		},
		"1ca6abcf-349c-4e32-9222-1a6375bd4a8b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow61",
			"name": "SequenceFlow61",
			"sourceRef": "2b0a62dc-4b45-4b63-a97b-2f860bcce996",
			"targetRef": "ef91a235-aa2c-42f8-9b1a-c3799343ac52"
		},
		"4ab8548a-fd15-4d6b-af74-84067a3c82b0": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"616eec04-9bb6-4d3a-a10e-ab0f4512d369": {},
				"d5e35e7d-25e6-45e5-a803-15c7a9810a7e": {},
				"a16a5088-600d-42bd-829a-fbbdd06604f4": {},
				"01f5c6b6-249f-4726-91ed-2307d2323aed": {},
				"fce5ea91-dbff-41f2-b7e2-0aeacc77aa63": {},
				"8607286e-c04a-463d-a218-b243fdb74914": {},
				"7bdcc596-ba0c-4f35-9195-417ce2d5cea8": {},
				"9ba9c8cf-6669-490e-9108-b59de89c724d": {},
				"c70603d3-3097-4658-b334-38a8358d4991": {},
				"e7b583bf-4c81-4cd1-85f7-98f9b132f05b": {},
				"dffd02fc-bbf7-472e-9321-8f4fc0b1db41": {},
				"edc55d59-feb6-4be5-a1e6-8fa85a454045": {},
				"e1fede1a-3146-4cfa-8ecf-766671e8470f": {},
				"c3257619-626c-4826-abcb-1f3b1e43ea7f": {},
				"d359f2df-4baa-407b-910e-4e9b0195a37c": {},
				"8fb9bbcc-6deb-40c1-b663-802a514c2589": {},
				"daa7020a-20da-449f-8d9d-f530234b05d3": {},
				"7ea20b4d-0e49-49d2-a6f6-ad437b403f48": {},
				"2f1b427f-bba8-4a85-b1f1-adf8d082ea5c": {},
				"35f975cb-9034-4ac5-a1ad-d3d2a250ad70": {},
				"f839142e-5cc3-42f2-8f8f-03a7c9e52887": {},
				"e220eb26-ae8b-4058-86c8-2e45ac5344e2": {}
			}
		},
		"8cbbcb83-667c-411f-9e37-be6006d3e622": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/onboard/SampleInputContext.json",
			"id": "default-start-context"
		},
		"616eec04-9bb6-4d3a-a10e-ab0f4512d369": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 41.499999701976776,
			"width": 32,
			"height": 32,
			"object": "5f136fac-3aee-4c23-b9e4-5e4b837f3a16"
		},
		"d5e35e7d-25e6-45e5-a803-15c7a9810a7e": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1430.9999976158142,
			"y": 41.499999701976776,
			"width": 32,
			"height": 32,
			"object": "b919de38-e160-4e57-8331-f1ee1aecd6f1"
		},
		"a16a5088-600d-42bd-829a-fbbdd06604f4": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 849,
			"y": 29.999999701976776,
			"width": 100,
			"height": 55,
			"object": "279de180-6739-4615-b4b4-254005ef4f2b"
		},
		"01f5c6b6-249f-4726-91ed-2307d2323aed": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1018.9999988079071,
			"y": 12,
			"width": 100,
			"height": 55,
			"object": "c3176c60-9c77-43ef-8273-dd6b919ff1db"
		},
		"fce5ea91-dbff-41f2-b7e2-0aeacc77aa63": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1188.9999976158142,
			"y": 36.499999701976776,
			"object": "a994f5eb-0a71-4d2c-bc67-94bde11a4052"
		},
		"8607286e-c04a-463d-a218-b243fdb74914": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1230.9999976158142,57.499999701976776 1280.9999976158142,57.499999701976776",
			"sourceSymbol": "fce5ea91-dbff-41f2-b7e2-0aeacc77aa63",
			"targetSymbol": "7bdcc596-ba0c-4f35-9195-417ce2d5cea8",
			"object": "0dc3be2e-8747-4908-869b-316b9f750d03"
		},
		"7bdcc596-ba0c-4f35-9195-417ce2d5cea8": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1280.9999976158142,
			"y": 29.999999701976776,
			"width": 100,
			"height": 55,
			"object": "8d59f760-8a8b-45cd-9591-2d05d71d7d12"
		},
		"9ba9c8cf-6669-490e-9108-b59de89c724d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1380.9999976158142,57.499999701976776 1430.9999976158142,57.499999701976776",
			"sourceSymbol": "7bdcc596-ba0c-4f35-9195-417ce2d5cea8",
			"targetSymbol": "d5e35e7d-25e6-45e5-a803-15c7a9810a7e",
			"object": "f1073489-0fa7-499d-a170-da7040951ceb"
		},
		"c70603d3-3097-4658-b334-38a8358d4991": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 394,
			"y": 29.499999701976776,
			"width": 105,
			"height": 56,
			"object": "7ba66efa-4d2e-47ff-bb5e-86e58b871488"
		},
		"e7b583bf-4c81-4cd1-85f7-98f9b132f05b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "949,57.499999701976776 983.9999994039536,57.499999701976776 983.9999994039536,39.5 1018.9999988079071,39.5",
			"sourceSymbol": "a16a5088-600d-42bd-829a-fbbdd06604f4",
			"targetSymbol": "01f5c6b6-249f-4726-91ed-2307d2323aed",
			"object": "57248737-d91c-4ab8-9c05-3fabb339baf4"
		},
		"dffd02fc-bbf7-472e-9321-8f4fc0b1db41": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,57.499999701976776 94,57.499999701976776",
			"sourceSymbol": "616eec04-9bb6-4d3a-a10e-ab0f4512d369",
			"targetSymbol": "f839142e-5cc3-42f2-8f8f-03a7c9e52887",
			"object": "86fd05ec-18d8-425c-bbf3-70aadf993806"
		},
		"edc55d59-feb6-4be5-a1e6-8fa85a454045": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 549,
			"y": 27.499999701976776,
			"width": 100,
			"height": 60,
			"object": "f9cf3524-7ac5-4f1e-8b34-509537875729"
		},
		"e1fede1a-3146-4cfa-8ecf-766671e8470f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "499,57.499999701976776 549,57.499999701976776",
			"sourceSymbol": "c70603d3-3097-4658-b334-38a8358d4991",
			"targetSymbol": "edc55d59-feb6-4be5-a1e6-8fa85a454045",
			"object": "0a02caf5-b4ab-4386-b05b-291b60cbae8d"
		},
		"c3257619-626c-4826-abcb-1f3b1e43ea7f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 699,
			"y": 27.499999701976776,
			"width": 100,
			"height": 60,
			"object": "fb3c8397-77da-427d-97ef-a19aad769c03"
		},
		"d359f2df-4baa-407b-910e-4e9b0195a37c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "649,57.499999701976776 699,57.499999701976776",
			"sourceSymbol": "edc55d59-feb6-4be5-a1e6-8fa85a454045",
			"targetSymbol": "c3257619-626c-4826-abcb-1f3b1e43ea7f",
			"object": "fdb9cc90-b782-41d6-abb2-db190074bd9b"
		},
		"8fb9bbcc-6deb-40c1-b663-802a514c2589": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "799,57.499999701976776 849,57.499999701976776",
			"sourceSymbol": "c3257619-626c-4826-abcb-1f3b1e43ea7f",
			"targetSymbol": "a16a5088-600d-42bd-829a-fbbdd06604f4",
			"object": "d6464a58-4838-482e-8ddb-20f95e78e551"
		},
		"daa7020a-20da-449f-8d9d-f530234b05d3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1118.999998807907,39.5 1153.9999982118607,39.5 1153.9999982118607,57.499999701976776 1188.9999976158142,57.499999701976776",
			"sourceSymbol": "01f5c6b6-249f-4726-91ed-2307d2323aed",
			"targetSymbol": "fce5ea91-dbff-41f2-b7e2-0aeacc77aa63",
			"object": "a8b03abe-f2b3-4b30-bac6-91b4791c3ce8"
		},
		"7ea20b4d-0e49-49d2-a6f6-ad437b403f48": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1188.9999976158142,57.499999701976776 1153.9999982118607,57.499999701976776 1153.9999982118607,101.99999940395355 983.9999994039536,101.99999940395355 983.9999994039536,57.499999701976776 949,57.499999701976776",
			"sourceSymbol": "fce5ea91-dbff-41f2-b7e2-0aeacc77aa63",
			"targetSymbol": "a16a5088-600d-42bd-829a-fbbdd06604f4",
			"object": "9c8e97e3-3749-4c31-b9aa-fcb7adbba772"
		},
		"2f1b427f-bba8-4a85-b1f1-adf8d082ea5c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 244,
			"y": 27.499999701976776,
			"width": 100,
			"height": 60,
			"object": "ef91a235-aa2c-42f8-9b1a-c3799343ac52"
		},
		"35f975cb-9034-4ac5-a1ad-d3d2a250ad70": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,57.499999701976776 394,57.499999701976776",
			"sourceSymbol": "2f1b427f-bba8-4a85-b1f1-adf8d082ea5c",
			"targetSymbol": "c70603d3-3097-4658-b334-38a8358d4991",
			"object": "8cde9675-e8ac-4379-92f3-5cc90bca0e11"
		},
		"f839142e-5cc3-42f2-8f8f-03a7c9e52887": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 94,
			"y": 27.499999701976776,
			"width": 100,
			"height": 60,
			"object": "2b0a62dc-4b45-4b63-a97b-2f860bcce996"
		},
		"e220eb26-ae8b-4058-86c8-2e45ac5344e2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,57.499999701976776 244,57.499999701976776",
			"sourceSymbol": "f839142e-5cc3-42f2-8f8f-03a7c9e52887",
			"targetSymbol": "2f1b427f-bba8-4a85-b1f1-adf8d082ea5c",
			"object": "1ca6abcf-349c-4e32-9222-1a6375bd4a8b"
		},
		"600eee18-fc10-4576-982b-74d08fbcb62e": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 2,
			"messageeventdefinition": 1,
			"hubapireference": 1,
			"sequenceflow": 62,
			"startevent": 1,
			"intermediatemessageevent": 1,
			"endevent": 2,
			"usertask": 5,
			"servicetask": 10,
			"scripttask": 6,
			"exclusivegateway": 4,
			"parallelgateway": 5
		}
	}
}