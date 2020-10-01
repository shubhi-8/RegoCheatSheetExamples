package equalityInRego.unification

## Unification (=) combines assignment and comparison.
## Rego will assign variables to values that make the comparison true. Unification lets you ask for values for variables that make an expression true.
## Playground Link : https://play.openpolicyagent.org/p/gVSIfFtpKP

employee = {employeeType,action}{
     [action,"Engineer"] = ["viewSalary",employeeType]
}


test_employee{
   employee =  {"Engineer",   "viewSalary"}
}
