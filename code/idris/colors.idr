module colors

import bool
import pair

%default total

data color = red | green | blue | cyan | magenta | yellow

complement: color -> color
complement red = cyan
complement cyan = red
complement green = magenta
complement magenta = green
complement blue = yellow
complement yellow = blue

additive: color -> bool
additive red = true
additive green = true
additive blue = true
additive _ = false

subtractive: color -> bool
subtractive c = not (additive c)

complements: pair color color -> bool
complements (mkPair red cyan) = true
complements (mkPair red _) = false
complements (mkPair cyan red) = true
complements (mkPair cyan _) = false
complements (mkPair green magenta) = true
complements (mkPair green _) = false
complements (mkPair magenta green) = true
complements (mkPair magenta _) = false
complements (mkPair blue yellow) = true
complements (mkPair blue _) = false
complements (mkPair yellow blue) = true
complements (mkPair yellow _) = false

mixink: pair color color -> color
mixink (mkPair yellow magenta) = red
mixink (mkPair magenta yellow) = red
mixink (mkPair yellow cyan) = green
mixink (mkPair cyan yellow) = green
mixink (mkPair cyan magenta) = blue
mixink (mkPair magenta cyan) = blue
