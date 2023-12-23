---
title: Inflation and localization in the context of EnKF
note: Evensen p.111
header-includes:
    - \usepackage{bm}
    - \newcommand{\bA}{\bm{A}}
    - \newcommand{\bX}{\bm{X}}
    - \newcommand{\bK}{\tilde{\bm{K}}}
    - \newcommand{\bD}{\bm{D}}
    - \newcommand{\bH}{\bm{H}}
    - \newcommand{\bY}{\bm{Y}}
    - \newcommand{\bW}{\bm{W}}
    - \newcommand{\bB}{\bm{B}}
    - \newcommand{\bC}{\bm{C}}
---

# EnKF formulations

La mise à jour EnKF peut être exprimé sous différentes forme suivant l'espace dans laquelle la mise à jour est exprimé. En notant $\bA$ la matrice d'annomalie d'ensemble on obtient soit une mise à jours avec le gain de Kalman d'ensemble

$$
\bX^a = \bX^f + \bK(\bD - h(\bX)),
$$, avec $\bK = \bA\bY^T(\bY \bY^T + R)^{-1}$ exprimé avec les approximations d'ensemble.

On peut aussi exprimer l'analyse comme une combinaison linéaire de l'état avec un terme de correction exprimé dans l'espace des observations.
$$
\bX^a = \bX^f + \bA \bW, 
$$ avec $\bW = \bY^T (\bY \bY^T + R)^{-1}(\bD - h(\bX))$,

Il y a enfin l'analyse a une interprétation en terme d'ensemble

$$
\bX^a = \bX^f + \bC_{xy} \bB = \bX^f + (\bA \bY)^T \bB,
$$
Où $\bB$ est une matrice de taille $mxN$ qui correspond au coefficient de la combinaison linéaire sur les fonctions de représentation qui sont de la matrice de représentaiton d'ensemble $\bC_{xy}$ . 

#Localisation
Un review a été fait par *Chen et Oliver (2017)*.
Introduite pour réduire les effets dû à l'approximation de rang faible avec le filtre de Kalman d'ensemble.
La localisation permet d'augmenter le rang effectif de l'ensemble (usually Rank(A) < N). Cela permet de prendre en compte un nombre plus important d'observations indépendantes. Aussi, cela permet de réduire l'erreur d'échantillonnage en combinant avec l'inflation. Cela est essentielle pour des méthodes de grande dimension.

Il existe plusieurs méthode de localisation soit la *localisation sur la matrice de covariance*, soit via *l'analyse locale*. On peut lire *Hamill et al., 2001*. Dans le premier cas, on va modifier la matrice de covariance en appliquant une matrice de corrélation, dans le second cas, on appliquer la mise à jour de l'analyse localement, c'est à dire qu'il y aura un découpage de l'état en fonction de l'influence des observations associées. On applique alors le filtrage sur $l$ problème en parallèle. On peut lire *Evensen (2003)*.

Cette dernière converge plus rapidement que le première dans le cas où la taille de l'ensemble est faible devant le nombre d'observation.

##Localisation sur Covariance
L'objectif est de mettre à 0 les corrélations de longue distance. 
On peut appliquer la localisation soit sur l'espace de l'état, soit sur l'espace d'observation. On défini pour cela un *taper* $\rho$ qui va être appliqué à la matrice de covariance d'état avec un produit d'Hadamard $\circ$ such as $\bC_{xx} = \rho \circ \bC_{xx}$.
Le produit d'Hadamard ou de Schur offre des propriétés interessante: 
- Si les deux matrices sont semi défini positive, le produit l'est également. Si l'une est définie positive et l'autre semi définie posiitve avec des diagonales positives alors le produit est défini positif.

De cette manière on applique une régularisation. Généraliement est taper est pris pour être une fonction de décressive en fonction de la distance $r$ et paramétré par une régulateur $l$ de telle sorte que

$$
\rho_{ij} = \exp(-d(x_i, x_j)^2/2r^2). 
$$

*Gaspiri and Cohn (1999)* ont proposés des fonctions polynomiale d'ordre 5 défini par morceaux (voir Localization in the Ensemble Kalman Filter et Lorend(2003)).


Dans ce cas on peut réécrire la mise à jour comme 
$$
\bX^a = \bX^f + (\rho \circ \bA\bA^T) H^T (\bH (\rho \circ \bA\bA^T) \bH^T + R)^{-1}(\bD - h(\bX)).
$$

D'après les propriétés du produit d'Hadamard, il peut être montré que $\rho \circ \bA\bA^T$ est bien une matrice de covariance.

La localization peut également se réaliser au niveau des observations. Houtekamer and Mitchell (2001) font une approximation telle que $(\rho \circ \bA\bA^T)H^T = \rho \circ (A$

Deux taper sont introduit $\rho_{xy}$ et $\rho_{yy}$ tel que 

$$
\bX^a = \bX^f + (\rho_{xy} \circ \bA\bY)^T ((\rho \circ \bY\bY^T) + R)^{-1}(\bD - h(\bX)).
$$


##Localisation au niveau de l'analyse

