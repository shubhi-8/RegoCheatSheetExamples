package test.complete.rule.test

authorize = {"decision": "permit"} {
     input.action.id == "exp"
}

authorize = {"decision": "deny"} {
  input.action.name == "adm"
}

test_authorize {
    authorize.decision=="permit" with input as {
      "action": { "id" : "exp" }
   }
}

test_fail_authorize {
    not authorize.decision=="deny" with input as {
      "action": { "name" : "exp" }
   }
}
