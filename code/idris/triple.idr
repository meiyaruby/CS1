module triple

import nat
import bool
import unit

data triple a b c = mkTriple a b c

thd: triple a b c -> c
thd (mkTriple a b c) = c
