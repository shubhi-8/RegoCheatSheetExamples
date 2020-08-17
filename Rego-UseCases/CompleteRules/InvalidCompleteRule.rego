package play

## evaluation produces multiple values for the same document, an error will be returned.

default  allow = {"result": "deny"}

allow = {"result": "allow"}{
    input.role =="Employee"
	input.action == "salary view"
}

allow = {"result": "deny"} {
     input.senior =="Manager"
	  input.action == "salary view"
}

