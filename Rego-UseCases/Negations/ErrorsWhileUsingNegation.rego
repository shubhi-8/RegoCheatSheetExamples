package play



#Rego is existentially quantified.
#This means that rule bodies and queries express FOR ANY and not FOR ALL.
#Thus, while using != it looks for a single value which is not equal to the value compared,
#however when we use negations we often need to compare FOR ALL rather than FOR ANY.


allow {
      allowed_actions := { "add", "delete", "edit"  }
      input.action != allowed_actions[_]
}


#Another rule that's enforced by OPA is that ,
#a variable appearing in a negated expression must also appear in another non-negated equality expression in the rule ,
#else it will throw an error.


allow {
    allowed_actions :=
    {"view_personal_info","edit_personal_info","view_salary",
    "update_salary"}
    not input.action == data.allowed_actions[_]
}
