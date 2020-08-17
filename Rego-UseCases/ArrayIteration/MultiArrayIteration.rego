package play

import data.rego-UseCases.ArrayIteration.MultiIterationData.json


#There are use-cases where instead of one value we need to compare multiple values corresponding to the value list present.
#We can use both the iterations as described in simple array example
#We can extract object info corresponding to the same values in two lists along with their index as described below.


role_id_set[{input_id,role_id}]{
some k,i
role_info.roles[k].qbn == input.role_set[i]
role_id := role_info.roles[k]
input_id := input.role_set[i]
}
