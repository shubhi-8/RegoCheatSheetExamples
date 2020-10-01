package assign.compare


allow = {"decision": "permit"} {
     input.action.id == "exp"
}

allow = {"decision": "deny"} {
  input.action.name == "adm"
}

test_allow {
   result := allow with input as {
      "action": { "id" : "exp" }
   }
   result.decision == "permit"
}

test_fail_allow {
    result :=   allow  with input as {
      "action": { "name" : "adm" }
   }
   result.decision == "deny"
}
