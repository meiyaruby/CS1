-- total functions
-- block comments
-- symbolic arguments
-- pattern matching: any argument

module bool

import Serialize

data bool = true | false

id: bool -> bool
id b = b

constFalse: bool -> bool
constFalse _ = false

constTrue: bool -> bool
constTrue _ = true

not: bool -> bool
not true = false
not _ = true

|||given a pair of bool values, (a, b), return true if both a and b are true, otherwise return false
and: bool -> bool -> bool
and true true = true
and _ _ = false

|||given a pair of bool values, (a, b), return false if both a and b are false, otherwise return true
or: bool -> bool -> bool
or false false = false
or _ _ = true

|||short for "not and", given a pair of bool values, (a, b), return false if both a and b are true, and true otherwise
nand: bool -> bool -> bool
nand n m = not (and n m)

|||short for "exclusive or", given a pair of bool values, (a, b), return true if exactly one of a or b is true, and false otherwise
xor: bool -> bool -> bool
xor true false = true
xor false true = true
xor _ _ = false

--Exam Problem #2: There are 16 possible ways to fill in the result column for a truth table for a binary Boolean function, and there are thus exactly 16 such functions, and no more.

pand: bool -> bool -> bool
pand true n = id n
pand false n = constFalse n

por: bool -> bool -> bool
por true n = constTrue n
por false n = id n

pxor: bool -> bool -> bool
pxor true n = not n
pxor false n = id n

pnand: bool -> bool -> bool
pnand true n = not n
pnand false n = constTrue n

eql_bool: bool -> bool -> bool
eql_bool true true = true
eql_bool false false = true
eql_bool _ _ = false

instance Serialize bool where
  toString true = "True"
  toString false = "False"
