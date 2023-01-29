locals {
  # these are literal expressions
  literal_number = 1
  literal_string = "a simple sentence"

  literal_map1 = {
    key1 = "value1"
    key2 = "value2"
  }

  literal_set1 = ["a", "b", "c"]
  literal_set2 = [1, 2, 3, 4]
  literal_object1 = {
    attribute1 = "value"
    complex_attribute = {
      attribute1 = "complex_value1"
    }
  }

  # these are examples of operator expressions
  arithmetic = local.literal_number + 1
  # equality expression can evaluate multiple types
  number_equality = local.literal_number == 2
  string_equality = local.literal_string == "a simple sentence"
  set_equality    = local.literal_set1 == ["a", "b", "c", "d"]
  object_equality = local.literal_object1 == {
    attribute1 = "value"
    complex_attribute = {
      attribute1 = "complex_value1"
    }
  }

  # comparison can only be done with number type
  comparison_number = local.literal_number < 0
  # logical operators chain multiple conditions
  logical_test1 = can(local.literal_map1.key1) && local.literal_number == 1
  logical_test2 = can(local.literal_map1.key3) || local.literal_number == 1

  # conditional expression
  size = "large"
  # return type must be the same
  conditional1 = (local.size == "large") ? "t2.large" : "t2.micro"
  # this will automatically be converted to string
  conditional2 = false ? "t2.large" : 5

  # for expressions the produce a set
  for_set1 = [
    for int in local.literal_set2 : int
    if int > 2
  ]
  # for expressions the produce a map
  for_map1 = { for int in local.literal_set2 : int => {
    one_more = int + 1
    }
  }
  for_map2 = { for key, value in local.literal_map1 : value => key }

  for_grouping = {
    for key, value in local.literal_map1 : value => key...
  }

  # splat can be a more concise what to extract a single attribute from set of objects
  literal_set3 = [
    {
      attribute1 = "value1"
    },
    {
      attribute1 = "value2"
    },
    {
      attribute1 = "value3"
    },
  ]
  splat    = local.literal_set3[*].attribute1
  no_splat = [for obj in local.literal_set3 : obj.attribute1]
}
