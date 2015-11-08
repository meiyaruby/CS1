module dnaTest

import dna

|||c_base test cases
cT: base
cT = c_base T
--expect A

cA: base
cA = c_base A
--expect T

cG: base
cG = c_base G
--expect C

cC: base
cC = c_base C
--expect G

|||c_strand test cases
cs: list base
cs = c_strand (A::T::G::C::nil)
--expect (T::A::C::G::nil)

|||strand test cases
s1: list base
s1 = strand1 (mkPair A T::mkPair G C::mkPair C G::mkPair T A::nil)
-- expect A::G::C::T::nil
s2: list base
s2 = strand2 (mkPair A T::mkPair G C::mkPair C G::mkPair T A::nil)
-- expect T::C::G::A::nil

|||pair base test cases
p1: pair base base
p1 = p_base A
-- expect mkPair A T
