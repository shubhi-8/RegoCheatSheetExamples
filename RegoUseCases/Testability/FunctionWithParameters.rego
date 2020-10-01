package test.function.parameter

contains_all_ignore_case(input_list,value_list){
	input_list_array := split(lower(input_list),",")
    count( {b | b:= lower(value_list[_]) } - {a | a := lower(input_list_array[_])}) == 0
    }


test_contains_all_ignore_case {
    contains_all_ignore_case("prep,review",{"prep", "review"})
}

not_test_contains_all_ignore_case {
    not contains_all_ignore_case("prep",{"prep", "review"})
}
