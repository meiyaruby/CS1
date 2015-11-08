module mixink

import pair

data sp = yellow | magenta | cyan
data ap = red | green | blue

mixink: pair sp sp -> ap
mixink (mkPair yellow magenta) = red
mixink (mkPair magenta yellow) = red
mixink (mkPair yellow cyan) = green
mixink (mkPair cyan yellow) = green
mixink (mkPair cyan magenta) = blue
mixink (mkPair magenta cyan) = blue
