module math

import nat
import list
import bool

prefix: Nat
prefix = sub (add 7 5) 2
-- sub is the prefix notation
-- 7 + 5 - 2

higherprec: Nat
higherprec = add 3 (mult 4 5)
-- 3 + 5 * 4 = 23

x: list bool
x = cons true (cons false (cons true (cons true nil)))
-- T :: F :: T :: T :: nil
-- "::" is right associative
