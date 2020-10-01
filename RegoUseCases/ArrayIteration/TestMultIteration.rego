package MultiArrayIteration

import data.RegoUseCases.ArrayIteration.role_info

test_role_id{

 role := role_id_set  with input as {
    "role_set":["CUSTOM","USER_MANAGEMENT_NONE","COMPANY_INFORMATION_VIEW","SALES_ASSOCIATE","WEB_LOGIN_DISABLED"]
	}

    role = {
        "COMPANY_INFORMATION_VIEW": "ADMIN",
        "CUSTOM": "TOPLEVEL",
        "SALES_ASSOCIATE": "OFFERING",
        "USER_MANAGEMENT_NONE": "ADMIN",
        "WEB_LOGIN_DISABLED": "ENTITLEMENT"
    }

}
