module ite
import bool

ite: bool -> a -> a -> a
ite true tb fb = tb
ite false tb fb = fb
-- if a is true, then one thing, else something else
