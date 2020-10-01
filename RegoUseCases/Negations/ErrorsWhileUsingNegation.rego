package Negations.ErrorsWhileUsingNegation

# Rego is existentially quantified.
# This means that rule bodies and queries express FOR ANY and not FOR ALL.
# Thus, while using != it looks for a single value which is not equal to the value compared.
# However when we use negations we often need to compare FOR ALL rather than FOR ANY.
# Playground Link: https://play.openpolicyagent.org/p/nvUPWyh3WU

allow {
      some i
      allowed_actions := { "add", "delete", "edit"  }
      input.action != allowed_actions[i]
}



# rule will throw an error if a variable appearing in a negated expression doesnt   appear in another non-negated equality expression in the rule
# Playground Link: https://play.openpolicyagent.org/p/qtanOZaJdQ

allow2 {

    allowed_actions :=
    {"view_personal_info","edit_personal_info","view_salary",
    "update_salary"}
    # some i
    # not input.action == allowed_actions[i]
}
