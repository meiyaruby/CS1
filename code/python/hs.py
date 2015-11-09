def hs(n):
    x = 0
    while (n != 1):
        x = x + 1
        print(n)
        if (n % 2 == 0):
            n = n//2
        else:
            n = 3 * n + 1
    print (n)
    x = x + 1
    print(x)
    return None
