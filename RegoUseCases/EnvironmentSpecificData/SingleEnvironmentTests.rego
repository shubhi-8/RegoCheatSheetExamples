package Environment.SingleStorage

import data.RegoUseCases.EnvironmentSpecificData.AllEnvironmentData.AllEnvironmentData as appData

test_allow {
	allow with input as
	{
    "connectingEnvironment": "prod",
    "employeeId": "Rachel",
    "httpMethod": "GET",
    "originalRequestURI": "/company/hr/manager",
    "teamId": "team1"
}
}
