package Negations.CorrectWayToNegate

# To express FOR ALL in Rego complement the logic in the ruling body (e.g., != becomes ==) and then complement the check using negation
# A variable appearing in a negated expression must also appear in another non-negated equality expression in the rule else it will throw an error.
# Playground Link: https://play.openpolicyagent.org/p/ZL8DU4x2u8

allow = true {
    not is_Action_Allowed
}

is_Action_Allowed = true {
    allowed_actions := { "add", "delete", "edit"  }
    input.action == allowed_actions[_]
}

test_allow {
  allow with input as
 {"action": "update"}
}
