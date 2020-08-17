package play

## Rules provide a complete definition by omitting the key in the head. Documents produced by rules with complete definitions can only have one value at a time.

default  allow = {"result": "deny"}

allow = {"result": "allow"}{
    input.role =="Employee"
	input.action == "salary view"
}

allow = {"result": "deny"} {
     input.role =="Manager"
	 not input.action == "salary view"
}

