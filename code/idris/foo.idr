module foo

import list
import nat

fancyp: list nat -> nat
fancyp nil = O
fancyp (h::t) = add h (fancyp t)

fancym: list nat -> nat
fancym nil = S O
fancym (h::t) = mult h (fancym t)

fancy: (a -> a -> a) -> a -> (list a) -> a
fancy f id nil = id
fancy f id (h::t) = f (h) (fancy f id t)
