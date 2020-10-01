package Environment.SingleStorage
import data.RegoUseCases.EnvironmentSpecificData.AllEnvironmentData.AllEnvironmentData as appData

#Maintain single storage for all the environments data

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
    output :=  appData[input.connectingEnvironment][input.originalRequestURI][input.httpMethod][input.teamId]
}


