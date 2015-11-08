module relationTest

import relation

|||Test cases for query2
years: Nat
years = query2 people gender age plus 0
-- expect 41

totalInches: Nat
totalInches = query2 people gender height mult 1
-- expect 3776

names: String
names = query2 people gender name (++) ""
-- expect "MaryGe"

|||Test case for count_rel (number of women in people)
number_w: Nat
number_w = count_rel people gender
-- expect 2

|||Test case for sum_rel
sum_age: Nat
sum_age = sum_rel people gender age
-- expect 41

sum_height: Nat
sum_height = sum_rel people gender height
-- expect 123

|||Test case for ave_rel
aveAge: pair Nat Nat
aveAge = ave_rel people gender age
-- expect mkPair 41 2

aveHeight: pair Nat Nat
aveHeight = ave_rel people gender height
-- expect 123 2
