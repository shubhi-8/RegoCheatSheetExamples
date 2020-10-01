package ConflictResolution.conflictResolution

#Rego evaluates all the rules and returns the output of all the rules that evaluate to true while executing partial rules.
#This can create conflicts in decision making, especially when both the permit and deny get executed.

#Conflicts can be avoided by wrapping the rules with the parent rule which is complete and maintains the uniqueness of the result.
#We solved it by creating an allow rule which is a complete rule and wraps the partial rules to unite to a single decision.

# Playground Link: https://play.openpolicyagent.org/p/O63ZYDXani

default allow = {"reason": "access denied" }

allow = {"permissions": permit } {
	permit
	not deny
}
allow = { "permissions": deny } {
	deny
}

permit[x] = y { [x, "hr"] = ["permit", y] }
deny[x] = y { [x, "employee"] = ["deny", y] }



test_allowed {
  allow.permissions = { "deny": "employee"}
  deny.deny = "employee"
  permit.permit = "hr"

}
