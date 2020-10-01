package test.mocking.data


is_Valid_action{

   input.action == data.AllowedAction[_]

}


test_is_Valid_action {
   is_Valid_action with input as {
      "action" : "read"
   }  with data.AllowedAction as MockData
}


test_not_is_Valid_action {
   not is_Valid_action with input as {
      "action" : "edit"
   }  with data.AllowedAction as MockData
}


MockData  = [

      "read",
      "write",
      "update",
      "delete"

]
