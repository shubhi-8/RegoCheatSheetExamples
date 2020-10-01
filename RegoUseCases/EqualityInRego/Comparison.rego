package equalityInRego.comparision

## Comparison checks if two values are equal within a rule.
## If the left or right-hand side contains a variable that has not been assigned a value, the compiler throws an error.
## Playground Link :https://play.openpolicyagent.org/p/sUJ99P7EvX

allow {
    input.employeeType ==  "HR"
}

test_allow {
  allow with input as {
  "employeeType" : "HR"
  }
}
