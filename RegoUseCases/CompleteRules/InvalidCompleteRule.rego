package completeRules.InvalidCompleteRule

## evaluation produces multiple values for the same document, an error will be returned.
## Playground Link : https://play.openpolicyagent.org/p/o2NV002oGo

default  allow = {"result": "deny"}

allow = {"result": "allow"}{
    input.role =="Employee"
	input.action == "salary view"
}

allow = {"result": "deny"} {
     input.senior =="Manager"
	  input.action == "salary view"
}



# test_allow_Complete_Rules {
#      allow.result = "deny" with input as
#   {
#     "action": "salary view",
#     "role": "Employee",
#     "senior": "Manager"
# }
# }

### policy.rego:3: eval_conflict_error: complete rules must not produce multiple outputs
