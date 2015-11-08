module ColorWheel

import pair

data primary = red | blue | yellow
data mixed =  violet | green | orange
data Mix t = mkMix t

mix: pair primary primary -> mixed
mix (mkPair red blue) = violet
mix (mkPair red yellow) = orange
mix (mkPair blue red) = violet
mix (mkPair blue yellow) = green
mix (mkPair yellow red) = violet
mix (mkPair yellow blue) = green

double: Mix t -> t
double (mkMix b) = b
