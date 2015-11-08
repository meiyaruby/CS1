module dolls

import nat

data dolls = solid | shell dolls

d1: dolls
d1 = solid

d2: dolls
d2 = shell solid

depth: dolls -> nat
depth (solid) = O
depth (shell solid) = S O
depth (shell n) = S (depth n)
