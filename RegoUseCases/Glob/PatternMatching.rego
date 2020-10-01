package glob.patternMatching

# Glob is useful for matching the pattern separated by delimiters as defined.
# This is suitable for use-cases where regex matching is required.

# Rego Playground: https://play.openpolicyagent.org/p/5QNfjE3hiF


# Match the api with the Url in regex form

api_attributes = {
    "[abc]at/dogs" ,
    "?et[a-z]/dogs/*",
    "pets/dogs/*/adopt",
    "pets/dogs/**/adopt"
}

api_attribute_default = {
    "[abc]at.dogs" ,
    "?et[a-z].dogs.*",
    "pets.dogs.*.adopt",
    "pets.dogs.**.adopt"
}
matchUrl {
    some path
    api_attributes[path]
    glob.match(path, ["/"], input.path)
}
matchDefault {
    some path
    api_attribute_default[path]
    glob.match(path, ["*"], input.path)
}



test1 {
 matchUrl with input as {
   "path": "bat/dogs"
}
}

test2  {
 matchUrl with input as {
   "path": "pets/dogs/dog123/dog234/cat123/adopt"
}
}

test3  {
 matchUrl with input as {
   "path": "pets/dogs/dog123"
}
}

test4 {
 matchDefault with input as {
   "path": "bat.dogs"
}
}

test5  {
 matchDefault with input as {
   "path": "pets.dogs.dog123.dog234.cat123.adopt"
}
}

test6  {
 matchDefault with input as {
   "path": "pets.dogs.dog123"
}
}
