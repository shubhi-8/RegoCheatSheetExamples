package partialRules.GeneratingObjects

## Head declaring a key and a value for the rule ##
## Playground Link: https://play.openpolicyagent.org/p/C0WIUYMSC2

allow[result] = action_id {
    input.action.id == "HR"
    action_id =  input.action.id
    result = "allow HR"
}

allow[result] =  action_id{
    input.action.name == "employee"
    action_id = input.action.name
    result = "allow employee"
}

test_allow {
 allow == {"allow HR": "HR","allow employee": "employee"}  with input as
 {
     "action": {
         "id": "HR",
         "name": "employee"
     }
 }
}
