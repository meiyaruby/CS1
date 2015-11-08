module eqTest

import eq
import nat
import unit

b: bool
b = (eql true true)
--boolean equality testing

n: bool
n = (eql O O)
--natural number equality testing

u: bool
u = (eql mkUnit mkUnit)
--unit equality testing
