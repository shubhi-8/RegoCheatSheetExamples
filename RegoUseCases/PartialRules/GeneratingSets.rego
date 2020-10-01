package partialRules.GeneratingSets

## Head declares only keys whose value is defined and returned from the body ##
## Playground Link: https://play.openpolicyagent.org/p/nRkaBvzZXw

allow[result] {
    input.action.id == "HR"
    result = "allow HR"
}
allow[result] {
    input.action.name == "employee"
    result = "allow employee"
}

test_allow {
 allow == {"allow employee","allow HR"} with input as
 {
     "action": {
         "id": "HR",
         "name": "employee"
     }
 }
}
