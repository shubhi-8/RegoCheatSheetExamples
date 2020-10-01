package Hierarchial.data.traversal

import data.RegoUseCases.HierarchicalDataTraversal.ApplicationPartnerMap

#Often we come across use cases where data is static but it branches in various layers like a tree[JSON tree].
#For instance: The HTTP request format is hierarchical branching from URI, method type to attribute parameters.
#We had one such use case where we needed to find if a mapping exists corresponding to the attribute value in a static data.
# Playground Link: https://play.openpolicyagent.org/p/I2poPkRxX7

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


test_allow {
 allow with input as
 {
     "employeeId": "Rachel",
     "httpMethod": "GET",
     "originalRequestURI": "/company/hr/manager",
     "teamId": "team1"
 } with  data.RegoUseCases.HierarchicalDataTraversal.ApplicationPartnerMap as MockData.ApplicationPartnerMap

}

MockData = {
  "ApplicationPartnerMap": {
    "/company/hr/manager": {
      "GET": {
        "team1": [
          "Ross",
          "Rachel"
        ],
        "team2": [
          "Penny"
        ]
      }
    },
    "/company/tech/employee": {
      "GET": {
        "team1": [
          "Monica",
          "Pheobe",
          "Chandler"
        ],
        "team2": [
          "Lenord"
        ]
      },
      "PUT": {
        "team3": [
          "Mike",
          "Gunther",
          "Jannice"
        ]
      }
    }
  }
}
