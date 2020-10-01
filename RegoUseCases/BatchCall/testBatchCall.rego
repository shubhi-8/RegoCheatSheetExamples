package batch.call

import data.RegoUseCases.BatchCall.ApplicationData.ApplicationPartnerMap as ApplicationPartnerMap

test_batch {
	batch_authorize  = [
        "allow",
        "deny"
    ]
    with input as
    {  "employeeId": "Rachel",
    "requests": [
        {
            "httpMethod": "GET",
            "originalRequestURI": "/company/hr/manager",
            "teamId": "team1"
        },
        {
            "httpMethod": "GET",
            "originalRequestURI": "/company/tech/employee",
            "teamId": "team2"
        }
    ]
    }

}
