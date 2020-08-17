package play

## Head declares only keys whose value is defined and returned from the body ##

allow[result] {
    input.action.id == "HR"
    result = "allow HR"
}
allow[result] {
    input.action.name == "employee"
    result = "allow employee"
}
