
import math


alpha_i = list()


# $$\alpha_i = \operatorname{round}\!\left(\frac{\arctan(2^{-i})}{\pi/2} \cdot 2^{44}\right), \quad i = 0 \dots 39$$


for i in range(0,40):
    alpha_i.append(round((math.atan(2**(-i)) / (math.pi/2)) * 2**44))

for i in range(0,40):
    print("\"" + format(alpha_i[i], "046b") + "\",")