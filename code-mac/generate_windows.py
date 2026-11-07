from mpmath import mp, mpf, pi, floor

mp.prec = 400   # 400 bits of precision for everything below

w = list()

for e in range(0, 256):
    w.append(int(floor((2/pi * mpf(2)**(e-150) % 4) * mpf(2)**80)))

for e in range(0, 256):
    print("\"" + format(w[e], "082b") + "\",")