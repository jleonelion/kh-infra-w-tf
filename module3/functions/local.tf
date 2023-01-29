locals {
  number1 = 1
  number2 = 2

  sentence     = "a simple sentence"
  commas       = "string,with,commas"
  base64string = "SGVsbG8gV29ybGQ="

  map1 = {
    key1 = "value1"
    key2 = "value2"
  }
  map2 = {
    key2 = "value2"
    key3 = "value3"
  }

  set1 = ["a", "b", "c"]
  set2 = ["c", "d", "e"]

  object1 = {
    attribute1 = "value"
    complex_attribute = {
      attribute1 = "complex_value1"
    }
  }

  book_map = {
    "Imaro" = {
      "author"           = "Charles R. Saunders"
      "language"         = "English"
      "pages"            = 224
      "publication-year" = 1981
    }
  }
}
