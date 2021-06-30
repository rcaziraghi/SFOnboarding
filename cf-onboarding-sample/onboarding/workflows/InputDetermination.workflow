{
	"contents": {
		"38b0fad4-d7fd-447b-b355-9a157060138c": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "inputdetermination",
			"subject": "InputDetermination",
			"name": "InputDetermination",
			"documentation": "InputDetermination",
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
				"b92c8eed-c812-4cd4-af3b-1237b4d9e8ca": {
					"name": "Input Selection "
				},
				"3e0aab31-a8f2-48ec-bc22-f8c406142309": {
					"name": "Retrieve Input"
				},
				"a490fe69-c29f-4205-a5e4-ba101377f9d6": {
					"name": "Other"
				},
				"c2809b33-28e7-44e6-ae14-b1bce2f993a3": {
					"name": "Call Country workflow"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"19cf50aa-78f1-4168-9a45-75842c3868a2": {
					"name": "SequenceFlow2"
				},
				"6e2b32ba-6a1e-49d8-923f-cabe1856e48f": {
					"name": "SequenceFlow5"
				},
				"ec455e83-8f24-4810-ae1c-e4ff2c2ff053": {
					"name": "Other"
				},
				"51c282ad-ca6f-4e88-8767-644f84e46346": {
					"name": "SequenceFlow11"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"087f9113-4904-4e1b-b9d0-60002983f2c4": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"b92c8eed-c812-4cd4-af3b-1237b4d9e8ca": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Please Enter Candidate ID and select Company assignment",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"recipientGroups": "",
			"formReference": "/forms/InputCollection.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "InputCollection"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask1",
			"name": "Input Selection "
		},
		"3e0aab31-a8f2-48ec-bc22-f8c406142309": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SFSF_Demo_2",
			"path": "/odata/v2/OnboardingCandidateInfo?$filter=candidateId eq ${context.response.CanID}",
			"httpMethod": "GET",
			"responseVariable": "${context.response.CInfo}",
			"id": "servicetask1",
			"name": "Retrieve Input"
		},
		"a490fe69-c29f-4205-a5e4-ba101377f9d6": {
			"classDefinition": "com.sap.bpm.wfs.ReferencedSubflow",
			"definitionId": "onboard",
			"inParameters": [{
				"sourceExpression": "${context.response.country}",
				"targetVariable": "${context.response.country}"
			}, {
				"sourceExpression": "${context.response.CInfo}",
				"targetVariable": "${context.CInfo}"
			}],
			"outParameters": [],
			"id": "referencedsubflow1",
			"name": "Other"
		},
		"c2809b33-28e7-44e6-ae14-b1bce2f993a3": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Call Country workflow"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "b92c8eed-c812-4cd4-af3b-1237b4d9e8ca"
		},
		"19cf50aa-78f1-4168-9a45-75842c3868a2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "b92c8eed-c812-4cd4-af3b-1237b4d9e8ca",
			"targetRef": "3e0aab31-a8f2-48ec-bc22-f8c406142309"
		},
		"6e2b32ba-6a1e-49d8-923f-cabe1856e48f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "a490fe69-c29f-4205-a5e4-ba101377f9d6",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"ec455e83-8f24-4810-ae1c-e4ff2c2ff053": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "Other",
			"sourceRef": "c2809b33-28e7-44e6-ae14-b1bce2f993a3",
			"targetRef": "a490fe69-c29f-4205-a5e4-ba101377f9d6"
		},
		"51c282ad-ca6f-4e88-8767-644f84e46346": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "SequenceFlow11",
			"sourceRef": "3e0aab31-a8f2-48ec-bc22-f8c406142309",
			"targetRef": "c2809b33-28e7-44e6-ae14-b1bce2f993a3"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"f03ec922-431e-42a9-832e-e9a904800360": {},
				"33235729-7bf2-46fb-b362-752704abad72": {},
				"d53a97f5-e7b5-4194-8756-1a021352d2d7": {},
				"8b81e19d-7272-46d6-a35c-4b8388b2b9bb": {},
				"9b824703-19a0-43e7-92e3-dc9b6a159838": {},
				"d1e59a63-9352-4dfc-9e24-b71ff52c8a14": {},
				"dcdda7b5-549d-4407-8865-4155891c51e2": {},
				"1de2b01c-844d-4183-a364-18a3e5c08625": {}
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
			"x": 1158,
			"y": 98,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,119.5 235,119.5",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "f03ec922-431e-42a9-832e-e9a904800360",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"f03ec922-431e-42a9-832e-e9a904800360": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 185,
			"y": 93,
			"width": 100,
			"height": 60,
			"object": "b92c8eed-c812-4cd4-af3b-1237b4d9e8ca"
		},
		"33235729-7bf2-46fb-b362-752704abad72": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "235,123 414.5,123",
			"sourceSymbol": "f03ec922-431e-42a9-832e-e9a904800360",
			"targetSymbol": "d53a97f5-e7b5-4194-8756-1a021352d2d7",
			"object": "19cf50aa-78f1-4168-9a45-75842c3868a2"
		},
		"d53a97f5-e7b5-4194-8756-1a021352d2d7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 366,
			"y": 93,
			"width": 97,
			"height": 60,
			"object": "3e0aab31-a8f2-48ec-bc22-f8c406142309"
		},
		"8b81e19d-7272-46d6-a35c-4b8388b2b9bb": {
			"classDefinition": "com.sap.bpm.wfs.ui.ReferencedSubflowSymbol",
			"x": 756,
			"y": 93,
			"width": 100,
			"height": 60,
			"object": "a490fe69-c29f-4205-a5e4-ba101377f9d6"
		},
		"9b824703-19a0-43e7-92e3-dc9b6a159838": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "806,119.25 1175.5,119.25",
			"sourceSymbol": "8b81e19d-7272-46d6-a35c-4b8388b2b9bb",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "6e2b32ba-6a1e-49d8-923f-cabe1856e48f"
		},
		"d1e59a63-9352-4dfc-9e24-b71ff52c8a14": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 553,
			"y": 95,
			"object": "c2809b33-28e7-44e6-ae14-b1bce2f993a3"
		},
		"dcdda7b5-549d-4407-8865-4155891c51e2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "577,123 806,123",
			"sourceSymbol": "d1e59a63-9352-4dfc-9e24-b71ff52c8a14",
			"targetSymbol": "8b81e19d-7272-46d6-a35c-4b8388b2b9bb",
			"object": "ec455e83-8f24-4810-ae1c-e4ff2c2ff053"
		},
		"1de2b01c-844d-4183-a364-18a3e5c08625": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "414.5,119.5 574,119.5",
			"sourceSymbol": "d53a97f5-e7b5-4194-8756-1a021352d2d7",
			"targetSymbol": "d1e59a63-9352-4dfc-9e24-b71ff52c8a14",
			"object": "51c282ad-ca6f-4e88-8767-644f84e46346"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 12,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 1,
			"exclusivegateway": 1,
			"parallelgateway": 1,
			"referencedsubflow": 2
		},
		"087f9113-4904-4e1b-b9d0-60002983f2c4": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/onboard/SampleInputContext.json",
			"id": "default-start-context"
		}
	}
}