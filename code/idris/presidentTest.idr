module presidentTest

import President
import list
import relation

mapO: list Nat
mapO = map President.age nil

mapA: list Nat
mapA = map President.age presidents

mapN: list String
mapN = map name presidents

is57: President -> bool
is57 p = if ((age p) == 57) then true else false

fiftysevenyearolds: list String
fiftysevenyearolds = map name (filter is57 presidents)

num_pres: Nat
num_pres = count_rel presidents vp
-- expect 2

sum_pres: Nat
sum_pres = sum_rel presidents vp age
-- expect 114

aveAge_pres: pair Nat Nat
aveAge_pres = ave_rel presidents vp age
-- expect mkPair 114 2
