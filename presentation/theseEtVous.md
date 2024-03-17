# Ma thèse en trois minutes

## Layout

- intro sérieuse
- Introduction avec une machine à laver et mixeur
- Mettre le schéma du début de ma thèse

Ma thèse s'inscrit dans le projet SIFCO de simulation de la fabrication du combustible. Et en particulier sur l'étape de broyage réalisé dans un broyeur à boulet. Son objectif mélanger et boyer différentes poudres d'uranium et de plutonium à la base de la fabrication des pastilles de combustible.

Alors a priori, le fonctionnement n'est pas plus compliqué que de laisser tourner votre machine à laver pendant quelques heures, ou bien votre mixeur pour faire votre mayonnaise.
Alors, si aujourd'hui c'est aussi simple pour vous, il a bien fallu décider de la quantité de linge ou d'ingrédient à introduire, la durée, de la vitesse à prescrire... Alors, pour trouver la combinaison obtimal, ca demande de réaliser des expériences... de nombreuses expériences... toutes ne sont pas fructueuses.

Alors on a besoin de mieux connaitre ce qui se passe à l'intérieur de la machine. Mais je vous déconseille de l'ouvrir toutes les deux secondes.
On peut aussi décider de simuler cette étapes... mais on reste limité à la modélisation que l'on en fait. Expérimentalement, on peut aussi faire des mesures... mais ici le problème c'est de réussir à revenir à la cause de ces observations.

Eh bien le coeur de ma thèse a été de développer des méthodes pour confronter la simulation et l'expérience. Plus exactement, cela a été de mettre en place des méthodes d'assimilation de données adaptées au simulation et observation du broyeur. Cela consiste à mettre à jour l'état de données prédite (l'ébauche) avec les données mesurées avec pour objectif final: une estimation optimale de l'état de la simulation de mon système au cours du temps et des paramètres de modélisation. --> Mettre le schéma du début de ma thèse. 

Quels challenges dans mon cas ? Ca a été l'adaptation des méthodes classiques pour le type de simulation du milieu granulaire.

En effet, si en mécanique des solides on utilise généralement un maillage pour discrétiser notre milieu, ou bien une grille en mécanique des fluides. Dans notre cas on utilise une représenation particulaire.




Alors la problématique de 
Première réponse --> Schéma d'assimilation de données
  - Dire que l'on utilise la méthode EnKF 
  - Présenter le schéma de EnKF en mode graph

Une discrétisation particulaire c'est quoi ?
Tout numéricien sait que pour résoudre un problème de mécanique, on a besoin de discrétiser l'espace et le temps 
Classiquement, on choisit deux approches Lagrangienne et Eulienne

Deuxième question --> comment mettre à jour la configuration particulaire ? la grande question c'est de pouvoir mettre à jour la configuration d'une simulation particulaire
  - Alors présenter les développements actuels
  - Dire que l'on a une méthode qui va repasser par une grille de calcul intermédiaire 
  - Ou que l'on va directement pondérer les poids des particules qui existent déjà
  
Troisième question --> Le truc avec les méthodes particulaires c'est que les particules ne sont pas partout on voudrait pouvoir aligner les configurations
- En fait c'est ce que l'on veut faire 

