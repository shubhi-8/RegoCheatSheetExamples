package batch.call

import data.RegoUseCases.BatchCall.ApplicationData.ApplicationPartnerMap as ApplicationPartnerMap

# We often make batch calls in a single request. We can use 'with' to iterate over the resources in input and written output as a list.
# This is how we do it.
# Playground Link: https://play.openpolicyagent.org/p/rnvlq55fVA


#check if mapping for employee exist in company vs original request url exist and return it

authorize = "allow" {
   allow
}
authorize = "deny"{
   not allow
}

allow {
    employeeExistInCompany
    employeeIdMap = split(input.employeeId,",")
    count(checkMapping(employeeIdMap)) == 0
}

employeeExistInCompany {
   count(findMapping)> 0
}

checkMapping(identityProvidersInput) = {a | a := identityProvidersInput[_]} -  {b | b := findMapping[_]}

findMapping = output {
  output :=  ApplicationPartnerMap[input.originalRequestURI][input.httpMethod][input.teamId]
}


batch_authorize = [result   |
      some i
      request := input.requests[i]
      result :=  authorize with input as {
      "employeeId" : input.employeeId,
      "httpMethod"  : request.httpMethod,
      "originalRequestURI" : request.originalRequestURI,
      "teamId" : request.teamId

     }
]

