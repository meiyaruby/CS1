'''Plot the function $f(x) = 3x$ for integer values of x
ranging from 0 inclusive to 10 exclusive.'''
import pylab as pl

x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

fx = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27]

pl.plot(x, fx)

pl.show()
