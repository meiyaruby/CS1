module math

import nat

add: pair nat nat -> nat
add (mkPair O m) = m
add (mkPair (S n) m) = S (add (mkPair n m))

multiply: pair nat nat -> nat
multiply (mkPair O m) = O
multiply (mkPair (S n) m) = add (mkPair m (multiply (mkPair n m)))

fact: pait nat nat -> nat
fact O = S O
fact (S n) = multiply (mkPair (S n) (fact n))
