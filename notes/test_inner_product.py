import matplotlib.pyplot as plt
import numpy as np


def phi(x,h):
    return np.exp(-x**2 / 2 / h**2) / (np.sqrt(2 *np.pi)* h)

def main():
    x = np.linspace(0,1,1000)
    hf = 0.1
    Gamma1 = 0.1
    y1 = Gamma1 * phi(x - 0.5, hf)
    y2 = phi(x - 0.6, hf)
    prod = y1 * y2
    # plt.plot(x, y1)
    # plt.plot(x, y2)
    # plt.plot(x, prod)
    inner1 = Gamma1 * np.sum(prod) * (x[1] - x[0])
    inner2 = phi(0.1, np.sqrt(2)*hf)
    print(f"{inner1=}, {inner2=}")
    print(y1.sum() * x[1])
    print(f"{x[1]*np.sum(phi(x - 0.5, 0.1))=}")
    print("place particles regularly")
    xp1 = np.linspace(0,1,10)
    h = xp1[1]
    xp2 = np.linspace(0,1,10) #np.arange(0, 1, h)
    G1 = Gamma1 * phi(xp1 - 0.5, hf) * h
    X = x[:, np.newaxis] - xp1[np.newaxis, :]
    print(X.shape, G1.shape)
    y1approx =  np.sum (G1[np.newaxis, :] * phi(X, h), axis=1)
    X_p = xp2[:, np.newaxis] - xp1[np.newaxis,:]
    Gp = np.zeros_like(xp2)
    Gp = np.sum(G1[ np.newaxis, :] * phi(X_p, np.sqrt(2) * h), axis=1) * h
    Gp_2 = np.sum (G1[np.newaxis, :] * phi(X_p, h), axis=1) * h

    print(f"{Gp.sum()=}, {G1.sum()=}")
    X = x[:, np.newaxis] - xp1[np.newaxis, :]
    y1bis = np.sum(Gp[np.newaxis, :] * phi(X, h), axis=1)
    y1ter = np.sum(Gp_2[np.newaxis, :] * phi(X, h), axis=1)

    plt.plot(x, y1approx, 'r')
    plt.plot(x, y1bis, 'g--')
    plt.plot(x, y1ter, 'b--')
    
    plt.show()


    return 
if __name__=="__main__":
    main()