module dna

import list
import nat
import ite
import pair

data base = A | T | C | G

c_base: base -> base
c_base A = T
c_base T = A
c_base C = G
c_base G = C

c_strand: list base -> list base
c_strand a = map c_base a

strand1: list (pair base base) -> list base
strand1 a = map fst a

strand2: list (pair base base) -> list base
strand2 a = map snd a

p_base: base -> pair base base
p_base a = mkPair a (c_base a)

complete: list base -> list (pair base base)
complete a = map p_base a

|||homework version of countBase
isOne: base -> base -> Nat
isOne T T = 1
isOne A A = 1
isOne C C = 1
isOne G G = 1
isOne _ _ = 0

countBase: list base -> base -> Nat
countBase nil a = 0
countBase l' a = list.foldr plus 0 (map (isOne a) l')

|||my version of countBase?
isSame: base -> base -> bool
isSame T T = true
isSame A A = true
isSame C C = true
isSame G G = true
isSame _ _ = false

ZeroOne: list base -> base -> list Nat
ZeroOne nil a = nil
ZeroOne (h::t) a = ite (isSame h a) (1::ZeroOne t a)
                              (0::ZeroOne t a)
cB: list base -> base -> Nat
cB nil a = 0
cB l' a = list.foldr plus 0 (ZeroOne l' a)
