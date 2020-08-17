package play


#Often we come across use cases where data is static but it branches in various layers like a tree[JSON tree].
#For instance: The HTTP request format is hierarchical branching from URI, method type to attribute parameters.
#We had one such use case where we needed to find if a mapping exists corresponding to the attribute value in a static data.


permit {
    partnerIdForApplicationIdExist
    identityProvidersInput := split( input.pId, ",")
    count(checkMapping(identityProvidersInput)) == 0
}

partnerIdForApplicationIdExist {
   count(findMapping)> 0
}

checkMapping(identityProvidersInput) = {a | a := identityProvidersInput[_]} -  {b | b := findMapping[_]}


findMapping = output {
  output :=  data.ApplicationPartnerMap[input.originalRequestURI][input.httpMethod][input.intuit_appid]
}
