module nat

import public bool
import public pair
import eq
import Serialize

data nat = O | S nat


||| returns true if the argument is (represents) zero, otherwise false
isZero: nat -> bool
isZero O = true
isZero _ = false

||| returns the successor of any given nat
succ: nat -> nat
succ n = S n

||| returns the predessesor of any given nat
pred: nat -> nat
pred O = O
pred (S n) = n

||| returns true if the argument is even otherwise false
evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n
--two base cases and one recursive case, keep recursing until base case
oddb: nat -> bool
oddb n = not (evenb n)

|||give a pair of natural numbers, return its sum
add: nat -> nat -> nat
add O m = m
add (S n) m = S (add n m)

|||give a pair of natural numbers, return its product
mult: nat -> nat -> nat
mult O m = O
mult (S n) m = add m (mult n m)

|||Factorial
fact: nat -> nat
fact O = (S O)
fact (S n) = mult (S n) (fact n)

||| Given a pari of natural numbers, (a, b), return a-b.
||| if a <= b, the answer will be O.
sub: nat -> nat -> nat
sub O m = O
sub n O = n
sub (S n) (S m) = sub n m

|||given a pair of natural numbers, (a, b), return true
||| if a <= b true otherwise return false
lepp: nat -> nat -> bool
lepp O m = true
lepp n O = false
lepp (S n) (S m) = lepp n m

|||- given a pair of natural numbers, (x, n), return the value of x raised to the nth power
expp: nat -> nat -> nat
expp x O = (S O)
expp O n = O
expp x (S n) = mult x (expp x n)

|||given a pair of natural numbers, (a, b), return true if a is equal to b, otherwise return false
eql_nat: nat -> nat -> bool
eql_nat O O = true
eql_nat n O = false
eql_nat O m = false
eql_nat (S n) (S m) = eql_nat n m

|||given a pair of natural numbers, (a, b), return true if a is greater than b, otherwise return false
gtpp: nat -> nat -> bool
gtpp n m = not (lepp n m)

|||given a pair of natural numbers, (a, b), return true if a is less than b
ltpp: nat -> nat -> bool
ltpp O O = false
ltpp O m = true
ltpp n O = false
ltpp (S n) (S m) = ltpp n m

instance eq nat where
  eql n1 n2 = eql_nat n1 n2

instance Serialize nat where
  toString O = "Z"
  toString (S n) = "s" ++ toString n
