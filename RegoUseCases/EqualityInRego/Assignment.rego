package equalityInRego.assignment

## Assigned variables are locally scoped to that rule and shadow global variables.
## Playground Link :https://play.openpolicyagent.org/p/K91zwb332V

employeeType := "HR"

allow {
    employeeType := "Manager"   # declare local variable
                                #'employeeType' and assign value
                                #Manager
    employeeType !=  "HR"       # true because 'employeeType'
                                #refers to local variable
}

test_allow {
  allow
}
