# Contexte: 
## Domaine: 
Construction du jumeau numérique du broyeur à boulets intervenant dans le broyage et le mélange de poudres de combustible nucléaire.
## Problématique générale: 
Faire communiquer expérience et simulation au cours du temps, en utilisant les données issues de l'expérimentation pour mettre à jour l'état de la simulation


Dans le domaine de la fabrication du combustible nucléaire, l'un des principaux enjeux consiste à pouvoir modéliser l'état . Ceci est dû au fait que l'on souhaiterait être capable d'optimiser cette étape pour réduire le temps de broyage et améliorer l'efficacité energétique. Le problème est que les modèles sont simplifiés, doivent être calibré et ne tiennent pas compte de toutes les physiques et ceci a pour conséquence d'augmenter l'erreur de prédiction.

## Csq: on ne réduit l'incertitude sur l'état et les paramètres de modèle.

# Etudes (2 exemples)

- Evensen 1994 A FAIT un filtre séquentiel d'ensemble. Il se base sur la propogation des incertitudes par une méthode de Monte-Carlo et une estimation des statistiques de l'état et des observations à partir d'un ensemble pour écrire le gain de Kalman.
   
- A PERMIS d'étendre le filtre de Kalman à des problèmes non-linéaire de grande dimension.

- LIMITES Cependant, du fait du modèle non-linéaire, les hypothèses de distribution Gaussienne ne sont plus conservé. Ainsi la distribution obtenue ne converge pas vers la distribution a posteriori. De plus, nécessite de développer des méthodes de localisation et d'inflation pour tenir compte d'erreurs d'échantillonnage.

- Sulzky et al. 1994 on fait une méthode particulaire avec grille sous jacente, appelée méthode des points matériau (MPM) adaptée à des matériaux avec variables d'histoire.
- A PERMIS de simuler de traiter des problèmes de mécanique des solides en grande transformation, de gérer des interfaces, des géométries complexe ou de la fracturation, par exemple la rhéologie des sols.
- LIMITES ils ont montré qu'il était possible de combiner des idées de PIC et ceux de FEM pour traiter le cas des déformations irréversibles en mécanique des sols. Ils n'ont pas exploré en détail comment définir les conditions limites, relaxer la condition de frotement sans glissement, l'utilisation de plusieurs matériaux par points matériau.

# Bilan général de l'ensemble du travail avant vous
- Des simulations de l'écoulement granulaire dans le broyeur à boulets ont été développé par des méthodes sans maillage. En particulier, la méthode DEM modélise directement les particules et leurs interaction, lorsque les méthodes MPM ou SPH vont discrétiser un milieu continu grâce à des particules.
- D'autres part, à partir de méthodes de traitement d'image, il est possible de mesurer les profils d'écoulement ou les champs de vitesse dans le broyeur à boulets.
- Des méthodes d'assimilation de données propose des schémas de mise à jour de l'état de la simulation à partir d'observations.
- Toutefois, les méthodes d'assimilation sont définis sont des discrétisations qui ne varient pas au cours du temps. Or les méthodes particulaires sont définis par des particules qui évoluent au cours du temps. La mise à jour de la position et de l'intensité des particules peut être impossible lorsque l'équilibre du système repose sur les interpénétration relative.
# C'est ce qui justifie cette thèse,
Elle consiste à développer des méthodes d'assimilation de données aaptées à des simulations sans-maillage afin de construire le jumeau numérique du broyeur à boulet s intervenant dans la fabrication du combustible de fusion.

# La démarche consiste à...

La démarche consiste dans le chapitre I à développer des méthodes pour adapter le filtre de Kalman d'ensemble à des simulations particulaires. Pour cela, l'idée a été de définir une correction qui soit indépendante des discrétisations particulaire des états. En effet, l'écriture du gain de Kalman d'ensemble dépend habituellement de celles-ci.
L'idée a été ensuite de mettre en place des mises à jour des représentations particulaires pour obtenir les états assimilés.

Ce premier développement a permis de développer deux adaptations différentes du filtre EnKF. Le chapitre II consiste a évaluer les capacités des filtres développés à assimiler les données sur plusieurs applications. L'idée a été de vérifier l'influence des paramètres de simulation et d'assimilation sur la qualité, c'est à dire en analysant leurs courbes de convergence d'erreur. Pour cela nous avons appliqué les filtres à plusieurs problème : un problème 1D où la solution analytique est connue, et un problème non linéaire de mécanique des fluides 2D en utilisant la méthode Vortex.

<!-- Cette deuxième partie a permis d'évaluer ces deux adaptations du filtre EnKF. Néanmoins, celles-ci on mis en évidence des faiblesses pour traiter le cas où la discrétisation particulaire ne permettait pas de supporter la solution analysée. De plus, elle nécessite
de 

celles-ci ne corrige que l'intensité des champs, et ne permettent pas de corriger la position du support de particule.  -->

L'objectif du chapitre III a été de développer un filtre d'ensemble mettant à jour la position des particules. Pour cela nous formuler le problème d'assimilation de données tenant compte des erreurs d'alignement et capable de corriger la position des particules. L'idée a été d'introduire une transformation pour aligner les particules dans un cadre variationnel.

L'objectif du chapitre IV a été d'évaluer la qua