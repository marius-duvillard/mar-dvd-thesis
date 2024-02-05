---
title: Data Assimilation with field alignment
header-includes:
    - \usepackage{bm}
    - \newcommand{\norm}[1]{\|#1\|}
    - \newcommand{\bq}{\bm{q}}
    - \newcommand{\br}{\bm{r}}
    - \newcommand{\bs}{\bm{s}}

---

Ravella introduit dans son papier 

*Ravela, Sai, Kerry Emanuel, et Dennis McLaughlin. « Data Assimilation by Field Alignment »*

Une méthode pour tenir compte des erreurs de position en appliquant un déplacement à imposer. La méthode est réalisée en deux étapes. D'abord la détermination d'un champ de déplacement, puis la correction des intensités. L'avantage de cette méthode, et quelle est adaptable à de nombreux filtres, en particulier les filtres d'ensemble. 

Il présente tout d'abord en quoi la formulation classique dans un problème de position entraîne une inflation de la matrice de covariance. La matrice issue de la perturbation d'une translation $\lambda$ devient: $C_{\lambda} = C_{XX} + \sigma^2_{\lambda} C_{\Delta\Delta}$ où $\Delta$ est la déviation du gradient (8).

Pour réaliser l'alignement, on part de la formule de Bayes comme pour les filtres d'intensité. Cependant, on introduit une nouvelle variable spatiale $\bq$ vecteur de déplacement. Dans leur travail l'état est défini sur une grille dont les positions sont $\br$. L'état est donc défini par les valeurs du champ $X = X(\br)$.

On défini $\bq$ sur la même grille tel que $X(\br  - \bq)$ est le déplacement de X par $\bq$.

On réécrit la formule de Bayes en introduisant cette nouvelle variable

$$
P(X, \bq \mid Y) \propto P(Y \mid X, \bq) P(X^f \mid \bq) P(\bq)
$$
 
La Likelihood $P(Y \mid X, \bq)$ est similaire à la likelihood sur les intensités mais en appliquant au préalable le déplacement de telle sorte que les observations sont conditionnées par $X(\br - \bq)$. 

On suppose donc que $Y = H(X(\br - \bq)) + \bm{\eta} \sim \mathcal{N}(0, R)$, où les observations restent bien fixes.

De même le prior sur l'intensité est inchangé en considérant au préalable la transformation $\bq$. Mais il faut remarquer que la matrice de covariance est dépendante de $\bq$. Dans un cas de filtre d'ensemble il s'agit de calculer la matrice également après transformation.

Finalement le prior sur le déplacement $P(\bq)$ est l'élément aditionnel. Pour cela on introduit une fonction d'énergie, qui va régulariser les déplacements. C'est elle qui introduit un coup de déplacement. On peut penser le champ de déplacement comme un champ d'écoulement lissé. Cette propriété de lissage amene donc à considérer des pénalisations de Tikhonov qui va pénaliser à la fois le gradient et la divergence. Mais on peut tout à fait modifier notre a priori sur la distribution de $\bq$. La prendre uniform n'apporterait pas d'information, la prendre gaussienne demande de définir une manière appropriée pour la définir. 
La contrainte ici reste locale mais elle introduit une forte régularité par pénalisation.

En prenant finalement la log likelihood on obtient la fonction de coût associée $J(X, \bq)$. On remarquera que un terme inhabituel lié à la dépendance de $P$ à $\bq$.

Ainsi on obtient

$$
J_2(X, \bq) = \frac12 \norm{(X - X^f)(\br - \bq)}^2_{P(\bq)} + \frac12 \norm{Y - H(X(\br - \bq))}^2_{R} + L(\bq) + \frac12 \ln{|B(\bq)|}.
$$

Pour résoudre le problème on a besoin de $P(\bq)$ et dériver toute la fonction coût. On peut utiliser pour cela un ensemble comme en EnKF pour l'estimer. 
Pour cela on suppose connu les déplacements associés  à chacun des membres $\bq_s$. On note $\bp_s = \br_s - \bq_s$. et on estime donc $B_Q$. Finalement, on finit par avoir une version Hybrid de la fonction de coût.

Il choisis également de fixer les déplacement dans l'évaluation de $B_Q$ pour éviter de devoir les différentier et modifier dans la version itérative. Il peut ainsi définir les gradients en fonction de $\bq_s$