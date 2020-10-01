package Separate.Environments

import data.RegoUseCases.EnvironmentSpecificData.qal.ApplicationPartnerMap as qal
import data.RegoUseCases.EnvironmentSpecificData.prod.ApplicationPartnerMap as prod


#In the software world, we don't make a release to prod directly instead,
#we have various development environments for quality, performance, end to end testing before we make a release in production.
#The data, however, is different in these different environments and there should be some way to identify what to use.

#PlaygroundLink : https://play.openpolicyagent.org/p/dwET4mc19c

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
	input.connectingEnvironment == "qal"
	output :=  qal[input.originalRequestURI][input.httpMethod][input.teamId]
}
findMapping = output {
	input.connectingEnvironment == "prod"
    output :=  prod[input.originalRequestURI][input.httpMethod][input.teamId]
}


