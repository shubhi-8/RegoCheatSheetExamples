package play


#To solve for both the issues we use negations by using the not operator as follows

allow = true {
not is_Action_Allowed
}

is_Action_Allowed = true {
      allowed_actions := { "add", "delete", "edit"  }
      input.action == allowed_actions[_]
}
