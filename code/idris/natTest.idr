module natTest

import nat

-- homework #5
--zero
z: nat
z = O

--one
o: nat
o = S O

-- two
t: nat
t = S (S O)

-- three
r: nat
r = S (S (S O))

-- four
f: nat
f = S r

-- five, six, seven
g: nat
l: nat
k: nat
g = S f
l = S g
k = S l

--homework #7
x: bool
x = (isZero r)

--homework #8
y: nat
y = succ O

-- homework #9
a: bool
a = evenb O
b: bool
b = evenb (S O)
c: bool
c = evenb (S (S O))
d: bool
d = evenb r
e: bool
e = evenb (S r)
-- homework #10
{-
evenb (S r) is a function application expression that can be evaluated
by first, deciphering (S r). (S r) is the sucessor of r, which is
bounded by the value of S (S (S O)). Therefore, (S r) is essentially
4. Then we look at the function evenb. evenb is a function of type nat
to bool, meaning that the outputs of evenb can only be either true of
false. evenb (S r) therefore evaluates the value of (S r), which can
also be written as S (S (S (S O)). As we can see that the binding values we
gave for evenb S (S n) is evenb n, so evenb (S r) = evenb (S (S (S (S
O))) which really equals to the function, evenb O, and we know
by definition that evenb O is true.
-}

{-
The first rule represents, in Idris, the arithmetic rule that zero
plus any value is just that value. The second rule represents, in Idris,
the arithmetic rule that the sum of (1 + n) + m = 1 + (n + m). Why these
two rules? The answer is that, together, they define a recursive function
for computing sums. The function is total because it covers both possible
cases for n (it's either O or the successor of some one-smaller nat) and
m matches any possible nat, so the rules cover all possible pairs of nats.

The real trick to understanding such a recursive function definition is
to understand how the application of this function to an argument will be
evaluated. In particular, the argument will match with one of the two
rules. If it matches the first rule, then the answer is returned, and
it is obviously correct. If the argument matches the second rule, then
(and here's the key) the result that is returned is the result obtained
by *evaluating* the right hand side of the rule, in the context of the
bindings of m and n to values. The evaluation of the right hand side
will in turn apply addp again. This *recursion* will stop only when the
*base case* is reached. It is guaranteed that the base case will be
reached because the first element of the pair passed to addp on each
recursive application of addp is "one smaller," and one can reduce a
nat by one only a finite number of times (because of the way in which
inductive types are defined!)

One can actually now prove that this definition of addition has all of
the usual properties of addition, such as commutativity, associativity,
and so forth; but we won't try to do any such proofs in this class!
-}

|||a test, expecting O
h1: nat
h1 = add O O
-- expect O

|||a test, expecting S (S O)
h2: nat
h2 = add O (S (S O))
-- expect 2

|||a test, expecting (S O)
h3: nat
h3 = add (S O) O
-- expect 1

|||a test, expecting (S (S (S (S (S O)))))
h4: nat
h4 = add (S (S O)) (S (S (S O)))
-- expect 5

|||multp
m1: nat
m1 = mult (S O) (O)
-- expect O

m2 : nat
m2 = mult (S (S O)) (S (S (S O)))
-- expect 6

|||Factorial
f1: nat
f1 = fact O
-- expect 1

f2: nat
f2 = fact (S (S (S O)))
-- expect 6

|||Subtraction
s1: nat
s1 = sub O (S O)
-- expect O

s2: nat
s2 = sub (S O) O
-- expect 1

s3: nat
s3 = sub (S (S O)) (S O)
--expect 1

|||a <= b true otherwise return false
lp1: bool
lp1 = lepp O (S O)
-- expect true

lp2: bool
lp2 = lepp (S O) O
-- expect false

lp3: bool
lp3 = lepp (S (S O)) (S O)
-- expect false

lp4: bool
lp4 = lepp (S O) (S (S O))
-- expect true

lp5 : bool
lp5 = lepp (S O) (S O)
-- expect true

|||exponents
exp1: nat
exp1 = expp (S (S O)) O
-- expect 1

exp2: nat
exp2 = expp O (S (S O))
-- expect O

exp3: nat
exp3 = expp (S (S O)) (S (S (S O)))
-- expect 8

|||equal
ep1: bool
ep1 = eqpp O O
-- expect true

ep2: bool
ep2 = eqpp (S O) O
-- expect false

ep3: bool
ep3 = eqpp O (S O)
-- expect false

ep4: bool
ep4 = eqpp (S (S O)) (S (S O))
-- expect true

ep5: bool
ep5 = eqpp (S (S (S O))) (S O)
-- expect false

|||if a>b true, otherwise false
gtp1: bool
gtp1 = not lp1
-- false

gtp2: bool
gtp2 = not lp2
-- true

gtp3: bool
gtp3 = not lp3
-- true

gtp4: bool
gtp4 = not lp4
-- false

gtp5: bool
gtp5 = not lp5
-- false

|||if a<b true, otherwise false
ltp1: bool
ltp1 = ltpp O O
-- expect false

ltp2: bool
ltp2 = lepp O (S O)
-- expect true

ltp3: bool
ltp3 = lepp (S O) O
-- expect false

ltp4: bool
ltp4 = lepp (S O) (S (S O))
-- expect true

ltp5: bool
ltp5 = lepp (S (S O)) (S O)
-- expect false

ltp6: bool
ltp6 = lepp (S (S O)) (S (S O))
-- expect false
