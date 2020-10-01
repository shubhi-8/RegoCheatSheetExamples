package walk.theJson

#Traversing deep down the hierarchy and find out the path exists or not can be solved by using "walk".
#We can manipulate this traversal information in various ways and make deductions.
## RegoPlayground:  https://play.openpolicyagent.org/p/nJ9tR0j6VA


##find the management chain for roll Id in input
foundpath = path {
	[path, value] := walk(ManagementChain)
    value= input.roleId
}

ManagementChain =
{
        "HR": 5,
        "SVP": {
            "Executive Assistant": 1,
            "FellowEngineer": {
                "DistinguishedEngineer": 2
            },
            "VP": {
                "Manager": 18,
                "PrincipalEngineer": 3
            }
        }
    }


test_found_path {
    foundpath =
    [
            "SVP",
            "FellowEngineer",
            "DistinguishedEngineer"
        ]
    with input as
    {
        "roleId": 2
    }
}
