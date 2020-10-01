package Separate.Environments

import data.RegoUseCases.EnvironmentSpecificData.qal.ApplicationPartnerMap
import data.RegoUseCases.EnvironmentSpecificData.prod.ApplicationPartnerMap

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
