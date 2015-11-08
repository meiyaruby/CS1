module President

import bool
import relation

|||This is a record type that is equivalent to
|||(data President = mkPres String Nat bool)
|||but where we give names to fields.
|||A president has a name and
|||an age in years when he was inaugurated and
|||a vice president or not during all the years of his presidency.

record President where
  constructor mkPres
  name: String
  age: Nat
  vp: bool

Pres1: President
Pres1 = mkPres "ThomasJefferson" 57 true

Pres2: President
Pres2 = mkPres "JamesMadison" 57 false

Pres3: President
Pres3 = mkPres "GeorgeWashinton" 57 true

Pres4: President
Pres4 = mkPres "HarrySTruman" 60 false

presidents: list President
presidents = Pres1::Pres2::Pres3::Pres4::nil
