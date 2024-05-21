import matplotlib.pyplot as plt
import numpy as np


def phi(x,h):
    return np.exp(-x**2 / 2 / h**2)

def main():
    x = np.linspace(0,1,1000)
    hf = 0.1
    y1 = phi(x - 0.4, hf)
    y2 = phi(x - 0.6, hf)
    prod = y1 * y2
    plt.plot(x, y1)
    # plt.plot(x, y2)
    # plt.plot(x, prod)
    inner1 = np.sum(prod) * (x[1] - x[0])
    inner2 = np.sqrt(np.pi) *hf* phi(0.2, np.sqrt(2)*hf)
    print(f"{inner1=}, {inner2=}")

    print("place particles regularly")
    xp = np.linspace(0,1,10)
    h = xp[1]
    X = x[np.newaxis,:] - xp[:, np.newaxis]
    G1 = phi(xp - 0.4, hf) * h
    print(X.shape, G1.shape)
    y1approx = np.sum(G1[:,np.newaxis] * phi(X, h), axis=0)

    # Gp = np.zeros_like(xp)
    # Gp = np.sqrt(np.pi) *h* phi(xp - 0.4, np.sqrt(2) * h)
    # y1bis = np.sum(Gp[:,np.newaxis] * phi(X, h), axis=0)
    # plt.plot(x, y1bis)
    plt.plot(x, y1approx)
    plt.show()


    return 
if __name__=="__main__":
    main()