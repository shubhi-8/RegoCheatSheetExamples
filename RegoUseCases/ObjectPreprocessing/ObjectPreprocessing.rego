package Object.Preprocessing


allow = {preproccessed,result}  {

    preproccessed = request_preprocessing
    result := create_decision_object(preproccessed)
}

### Request Modification
request_preprocessing = preprocessedObject {

	# Trim white spaces
    documentType := trim(input.DocumentType, " ")
    action := trim(input.action, " ")
    permissionsString := trim(input.Permissions, " ")

    # Check if not null and empty
    not is_null(permissionsString)
    permissionsString != ""
    not is_null(documentType)
    documentType != ""
    not is_null(action)
    action != ""

    ## concat to for valid action
    tempArray := array.concat([documentType],[action])
    permission := concat(".",tempArray)

    preprocessedObject := {"documentType" : documentType,
							"action" :action,
                            "permissionsString" : permissionsString,
                            "resource-action" : tempArray,
                            "permission" : permission}
}

### Response creation

create_decision_object (preproccessed) = decisionObject {
 ## Default to null if not present ##
 decisionObject := {"documentType": object.get(preproccessed,"documentType", null), "action": object.get(preproccessed,"action", null)}
}


test_allow {
    allow =
   {
       {
           "action": "create",
           "documentType": "HireDocs",
           "permission": "HireDocs.create",
           "permissionsString": "HireDocs.create,HireDocs.read,HireDocs.delete,HireDocs.update",
           "resource-action": [
               "HireDocs",
               "create"
           ]
       },
       {
           "action": "create",
           "documentType": "HireDocs"
       }
   }
     with input as
    {
        "DocumentType": "HireDocs ",
        "Permissions": "HireDocs.create,HireDocs.read,HireDocs.delete,HireDocs.update",
        "action": " create ",
        "userid": "1234"
    }
}
