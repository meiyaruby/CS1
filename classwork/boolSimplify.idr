module bool

data bool = true | false

id: bool -> bool
-- id true = true
-- id false = false
id x = x
-- can pick any variable, called pattern matching

constTrue: bool -> bool
--constTrue true = true
--constTrue false = true
constTrue _ = true
--wild card

constFalse: bool -> bool
constFalse _ = false

not: bool -> bool
not true = false
not false = true


