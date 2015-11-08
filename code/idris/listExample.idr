module listExample

import President
import list

listPresident: list President
listPresident = Pres1::Pres2::Pres3::Pres4::nil


mapAge: list President -> list Nat
mapAge nil = nil
mapAge (h::t) = (age h)::(mapAge t)
