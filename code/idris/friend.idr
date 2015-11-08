module friend

import bool

||| a friend is someone who is or isn't trustworthy,
||| who has a name
||| who has an age in years
data friend = mkFriend bool String Nat

f1: friend
f1 = mkFriend true "Doug" 19

f2: friend
f2 = mkFriend false "Kevin" 50

getAge: friend -> Nat
getAge (mkFriend b s n) = n

getTrust: friend -> bool
getTrust (mkFriend b s n) = b

getName: friend -> String
getName (mkFriend b s n) = s
