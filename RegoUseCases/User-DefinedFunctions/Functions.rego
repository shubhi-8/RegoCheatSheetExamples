package user.utility.functions

#Rego provides great function support but sometimes we need to define our functions.

## Playground Link: https://play.openpolicyagent.org/p/OadLtxjNPX

allow{
	contains_all_ignore_case(input.actionsToRevoke,{"add", "delete"})
	contains_any_ignore_case(input.actionsToRevoke,{ "add"})
	containsIn(PermissionArray,input.permission)
	}

contains_all_ignore_case(input_list,value_list){
	input_list_array := split(lower(input_list),",")
    count( {b | b:= lower(value_list[_]) } - {a | a := lower(input_list_array[_])}) == 0
    }

contains_any_ignore_case(input_list,value_list){
     input_list_array := split(lower(input_list),",")
 	 diff := {b | b:= lower(value_list[_]) } & {a | a := lower(input_list_array[_])}
     count(diff) > 0
 }

containsIn(PermissionArray, permission) {
 	PermissionArray[_] = permission
}


PermissionArray = [
        "read",
        "write",
        "update",
        "delete"
]

test_allow{
 	allow with input as
    {
    "actionsToRevoke": "add,delete",
    "permission": "write"
	}

 }
