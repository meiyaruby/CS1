module gunrow

import list

||| A record of this type represents a country and the death rate
||| per 10,000 by gun per year
||| for homocides, suicides, unintentional, other

data country = Argentina | Australia | Austria | Honduras | USA
data gunrow = mkGunrow country Nat Nat Nat Nat

argen: gunrow
argen = mkGunrow Argentina 190 279 64 362

austrl: gunrow
austrl = mkGunrow Australia 11 62 5 8

austri: gunrow
austri = mkGunrow Austria 18 268 1 8

hondu: gunrow
hondu = mkGunrow Honduras 648 0 0 0

usa: gunrow
usa = mkGunrow USA 355 670 16 9

countryName: gunrow -> country
countryName (mkGunrow c h s u o) = c

homocidesPer10M: gunrow -> Nat
homocidesPer10M (mkGunrow c h s u o) = h

suicidesPer10M: gunrow -> Nat
suicidesPer10M (mkGunrow c h s u o) = s

unintentionalPer10M: gunrow -> Nat
unintentionalPer10M (mkGunrow c h s u o) = u

otherPer10M: gunrow -> Nat
otherPer10M (mkGunrow c h s u o) = o

listGunrow: list gunrow
listGunrow = cons argen (cons austrl (cons austri (cons hondu (cons usa nil))))
