package play

## Head declaring a key and a value for the rule ##

allow[result] = action_id {
    input.action.id == "HR"
    action_id =  input.action.id
    result = "allow HR"
}
allow[result] =  action_id{
    input.action.name == "employee"
    action_id = input.action.name
    result = "allow employee"
}
