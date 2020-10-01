package Hierarchical.Search


## Rego provides a feature to load static data and use that information to author and derive outcomes from the policy.
## Based on the given input, how do we search and find a pattern?

# PlayGround Link: https://play.openpolicyagent.org/p/qmkxsHHNQs

##### return all publically accessable apis and method ########

api_attributes = {
    "v1/test1": {
        "GET": {"readonly": true, "public": true},
         "PUT": {"readonly": false, "public": false},
        "DELETE": {"readonly": false, "public": false},
    },
    "v2/test2/*": {
        "GET": {"readonly": true, "public": false},
        "PUT": {"readonly": false, "public": false},
        "DELETE": {"readonly": false, "public": false},
    },
    "v1/v2/*/test3": {
        "GET": {"readonly": true, "public": false},
        "POST": {"readonly": false, "public": false},
        "DELETE": {"readonly": false, "public": false},
    }
}

api_is_read[result]{
    some path
    value := api_attributes[path]
    value[input.method].public == true
    result := path
}


test_api_read {
  api_is_read = {"v1/test1"}
  with input as
  {
   "method": "GET"
  }
}
