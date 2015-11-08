module list

import public pair
import public bool
import nat
import ite
import eq
import Serialize

infixr 7 ::,++
-- r stands for right associative, 7 is the precedence

data list a = nil | (::) a (list a)
-- A polymorphic/generic list abstract data type

length: list a -> Nat
length nil = 0
length (n::l') = S (length l')

|||append as an infix operator ++
(++): list a -> list a -> list a
(++) nil nil = nil
(++) nil l2 = l2
(++) (h::l1') l2 = h::(l1'++l2)

map: (a -> b) -> list a -> list b
map f nil = nil
map f (h::t) = (f h)::(map f t)

filter: (a -> bool) -> list a -> list a
filter f nil = nil
--if (ite) some element is true, then return 1st result, else return 2nd result
filter f (h::t) = ite (f h)
                      (h::(filter f t))
                          (filter f t)
--filter evenb filters out non-even nat

foldr: (a -> a -> a) -> a -> list a -> a
foldr f id nil = id
foldr f id (h::t) = f h (list. foldr f id t)

member: (eq a) => a -> list a -> bool
member v nil = false
member v (h::t) = ite (eql v h) (true) (member v t)
--if a is a member of the eq type class then we can run this function

--typeclass instances
instance (eq a) => eq (list a) where
  eql nil nil = true
  eql (h::t) nil = false
  eql nil (h::t) = false
  eql (h1::t1) (h2::t2) = and (eql h1 h2) (eql t1 t2)

subset_elements: (eq a) => list a -> list a -> bool
subset_elements nil l2 = true
subset_elements (h::t) l2 = and (member h l2) (subset_elements t l2)

same_elements: (eq a) => list a -> list a -> bool
same_elements l1 l2 = and (subset_elements l1 l2) (subset_elements l2 l1)

toStringList: (Serialize a) => list a -> String
toStringList nil = ""
toStringList (h::nil) = toString h
toStringList (h::t) = (toString h) ++ ", " ++ (toStringList t)

instance (Serialize a) => Serialize (list a) where
  toString l = "["++ (toStringList l) ++"]"
