module set_adt_hwTest

import set_adt_hw
import bool
import list
import nat
import eq
import option
import Serialize

|||isEmpty test cases
isEmptyT: bool
isEmptyT = isEmpty (mkSet nil) {a = bool}
--expect true

isEmptyF: bool
isEmptyF = isEmpty (mkSet (O::nil))
--expect false
-----------------------------------------------------------
|||set_insert test cases

insert1: set bool
insert1 = set_insert true (mkSet (true::nil))
--expect (mkSet (true::nil))

insert2: set bool
insert2 = set_insert false (mkSet (true::nil))
--expect (mkSet (false::true::nil))
-----------------------------------------------------------
|||set_remove test cases

listremove: list bool
listremove = list_remove true (true::true::false::nil)
--epect (false::nil)

remove1: set bool
remove1 = set_remove true (mkSet (true::true::false::nil))
--expect mkSet (false::nil)

remove2: set bool
remove2 = set_remove true (mkSet (false::false::nil))
--expect mkSet (false::false::nil)

remove3: set nat
remove3 = set_remove O (mkSet (O::(S O)::(S (S O))::O::nil))
--expect mkSet ((S O)::(S (S O))::nil)
-----------------------------------------------------------
|||set_cardinality test cases

cardinality1: nat
cardinality1 = set_cardinality (mkSet nil) {a = bool}
--expect O

cardinality2: nat
cardinality2 = set_cardinality (mkSet (true::false::nil))
--expect (S (S O))

cardinality3: nat
cardinality3 = set_cardinality (mkSet (O::(S O)::(S (S O))::nil))
--expect (S (S (S O)))
-----------------------------------------------------------
|||set_member test cases

memberO: bool
memberO = set_member true (mkSet nil)
--expect false

member1: bool
member1 = set_member true (mkSet (true::false::false::nil))
--expect true

member2: bool
member2 = set_member false (mkSet (true::true::nil))
--expect false

member3: bool
member3 = set_member O (mkSet ((S O)::O::(S (S O))::nil))
--expect true
-----------------------------------------------------------
|||set_union test cases

unionO: set bool
unionO = set_union (mkSet nil) (mkSet nil) {a = bool}
--expect mkSet nil

union1: set bool
union1 = set_union (mkSet (true::false::nil)) (mkSet nil)
--expect mkSet (true::false::nil)

union2: set bool
union2 = set_union (mkSet nil) (mkSet (true::false::nil))
--expect mkSet (true::false::nil)

union3: set bool
union3 = set_union (mkSet (true::nil)) (mkSet (false::true::nil))
--expect mkSet (false::true::nil)

union4: set bool
union4 = set_union (mkSet (true::nil)) (mkSet (false::nil))
--expect mkSet (true::false::nil)
-----------------------------------------------------------
|||set_intersection test cases

intersectO: set bool
intersectO = set_intersection (mkSet nil) (mkSet nil)
--expect mkSet nil

intersect1: set bool
intersect1 = set_intersection (mkSet (true::false::nil)) (mkSet nil)
--expect mkSet nil

intersect2: set bool
intersect2 = set_intersection (mkSet (true::false::nil)) (mkSet (false::true::nil))
--expect mkSet (true::false::nil)

intersect3: set nat
intersect3 = set_intersection (mkSet (O::(S O)::(S (S O))::nil)) (mkSet ((S O)::(S (S O))::(S (S (S O)))::nil))
--expect mkSet ((S O)::(S (S O))::nil)
-----------------------------------------------------------
|||set_difference test cases

diffO: set bool
diffO = set_difference (mkSet nil) (mkSet (true::false::nil))
--expect nil

diff1: set bool
diff1 = set_difference (mkSet(true::false::nil)) (mkSet(true::nil))
--expect (false::nil)

diff2: set nat
diff2 = set_difference (mkSet (O::(S O)::(S (S O))::(S (S (S O)))::nil)) (mkSet (O::(S O)::nil))
--expect mkSet ((S (S O))::(S (S (S O)))::nil)
-----------------------------------------------------------
|||set_forall test cases

forall1: bool
forall1 = set_forall (bool.id) (mkSet (true::true::true::nil))
--expect true

forall2: bool
forall2 = set_forall (bool.id) (mkSet (true::true::false::nil))
--expect false

forall3: bool
forall3 = set_forall (evenb) (mkSet (O::(S (S O))::(S (S (S (S O))))::nil))
--expect true

forall4: bool
forall4 = set_forall (evenb) (mkSet (O::(S O)::(S (S O))::nil))
--expect false
-----------------------------------------------------------
|||set_exists test cases

existsO: bool
existsO = set_exists isZero (mkSet nil)
--expect false

exists1: bool
exists1 = set_exists isZero (mkSet ((S O)::O::(S (S O))::nil))
--expect true

isTrue: bool -> bool
isTrue a = id a

exists2: bool
exists2 = set_exists isTrue (mkSet (false::false::nil))
--expect false

exists3: bool
exists3 = set_exists isTrue (mkSet (true::false::nil))
--expect true
-----------------------------------------------------------
|||set_witness test cases

witnessO: option bool
witnessO = set_witness isTrue (mkSet (false::false::nil))
--expect none

witness1: option bool
witness1 = set_witness isTrue (mkSet (false::false::true::nil))
--expect some true

witness2: option nat
witness2 = set_witness evenb (mkSet ((S O)::(S (S (S O)))::nil))
--expect none

witness3: option nat
witness3 = set_witness evenb (mkSet ((S O)::(S (S O))::(S (S (S O)))::nil))
--expect some (S (S O))
-----------------------------------------------------------
|||set_product test cases

productO: set (pair bool bool)
productO = set_product (mkSet nil) (mkSet (true::false::nil))
--expect mkSet nil

product1: set (pair bool bool)
product1 = set_product (mkSet (true::false::nil)) (mkSet (true::false::nil))
--expect mkSet (mkPair true true :: mkPair true false :: mkPair false true :: mkPair false false :: nil)

product2: set (pair bool nat)
product2 = set_product (mkSet (true::false::nil)) (mkSet (O::(S O)::nil))
--expect mkSet  (mkPair true O :: mkPair true (S O) :: mkPair false O :: mkPair false (S O) :: nil)
-----------------------------------------------------------
|||powerset test cases

--powerset: set (set a)
--powerset = set_powerset (mkSet (O::(S O)::nil))

-----------------------------------------------------------
|||set_toString and toString test cases

set_toStringO: String
set_toStringO = set_toString (mkSet nil) {a = bool}
--expect ""

set_toString1: String
set_toString1 = set_toString (mkSet (true::false::nil))
--expect "True, False"

stringSetO: String
stringSetO = toString (mkSet nil {a= bool})
--expect "{}"

stringSet1: String
stringSet1 = toString (mkSet (true::false::nil))
--expect "{True,False}"

stringSet2: String
stringSet2 = toString (mkSet (O::(S O)::(S (S O))::nil))
--expect "{Z, sZ, ssZ}"
