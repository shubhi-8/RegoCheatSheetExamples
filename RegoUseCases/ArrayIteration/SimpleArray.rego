package arrayIteration.simpleArray

## This is useful to verify if an input exists in the array list. Time Complexity of this operation is O(n)
## Playground Link: https://play.openpolicyagent.org/p/b8ngVw42Df
allow {
    input.role =="Employee"
    allowedActionEmployee := ["salary_view","update_personal_info","view_personal_info"]
	input.action = allowedActionEmployee[_]
}
allow {
     input.role =="HR"
	 allowedActionHR := ["salary_view","salary_edit","view_personal_info","add/remove_employee"]
     some i
     input.action = allowedActionHR[i]
}

test_allow {
    allow with input as
    {
        "action": "view_personal_info",
        "role": "Employee"
    }
}
