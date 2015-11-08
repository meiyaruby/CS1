module listTest

import list
import listExample
import President
import nat
import ite
import eq

lengthO: Nat
lengthO = length nil {a=Nat}
-- expect 0

length1: Nat
length1 = length (1::nil)
-- expect 1

length3: Nat
length3 = length (1::2::3::nil)
-- expect 3

appendO: list Nat
appendO = nil++nil
-- expect nil

append1: list Nat
append1 = nil++(1::nil)
-- expect (1::nil)

append2: list Nat
append2 = (1::nil)++(2::nil)
-- expect (1::2::nil)

l:list bool
l = true :: false :: true :: true :: nil

mapO: list Nat
mapO = map President.age nil

mapA: list Nat
mapA = map age listPresident

mapN: list String
mapN = map name listPresident

is57: President -> bool
is57 p = if ((age p) == 57) then true else false

fiftysevenyearolds: list String
fiftysevenyearolds = map name (filter is57 listPresident)

AmIHappy: String
AmIHappy = ite true "Of course!" "Never"

AmISad: String
AmISad = ite false "Of course!" "Never"

map1: list bool
map1 = map evenb (O::(S O)::(S (S O))::(S (S (S (S O))))::nil)
filter1: list nat
filter1 = filter evenb (O::(S O)::(S (S O))::(S (S (S (S O))))::nil)

member1: bool
member1 = member O ((S O)::O::(S (S O))::nil)
--expect true

subset_elements1: bool
subset_elements1 = subset_elements ((S O)::O::(S (S O))::nil) (O::(S O)::(S (S O))::nil)
--expect true
subset_elements2: bool
subset_elements2 = subset_elements (O::(S (S O))::nil) (O::(S O)::(S (S O))::nil)
--expect true
subset_elements3: bool
subset_elements3 = subset_elements ((S (S (S O)))::nil) (O::(S O)::(S (S O))::nil)
--expect false

same_elements1: bool
same_elements1 = same_elements ((S O)::O::(S (S O))::nil) (O::(S O)::(S (S O))::nil)
--expect true
same_elements2: bool
same_elements2 = same_elements (O::(S (S O))::nil) (O::(S O)::(S (S O))::nil)
--expect false
