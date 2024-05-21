# Ma thèse en trois minutes



## Layout

-> L'amorce après 10-15s mis la table et ouvert l'appétit
-> Prestation: sourir, être naturel
-> Vite poser le sujet-> avant le premier tier -> ue minute "mon projet c'est"
-> Le vécu: Première personne, c'est un spectacle
-> Vulgarisation, faire appel au vécu
-> L'humour: réhausse la présentation : faire sourir puis réfléchir
-> La chute finale: montrer les possibilités infinies, ou bien terminé l'histoire que l'on avait entamée. 

- Introduction avec une machine à laver et mixeur
- intro sérieuse
- Mettre le schéma du début de ma thèse

Ma thèse s'inscrit dans le projet SIFCO de simulation de la fabrication du combustible. Et en particulier sur l'étape de broyage et de mélange de poudres réalisé à l'aide d'un broyeur à boulet. C'est une étape qui a son importante pour s'assurer de la bonne homogénéité des poudres (par exemple : poudres U02  et Pu02 dans le cas du MOX) et d'autre part de réduire la taille des poudres.
A priori, le fonctionnement ne semble pas plus compliqué que de laisser tourner votre machine à laver pendant quelques heures, ou bien votre mixeur pour faire votre mayonnaise.
Si aujourd'hui c'est aussi simple pour vous, il a bien fallu décider de la quantité de linge ou d'ingrédient à introduire, la durée, de la vitesse à prescrire... Et dans notre cas, on traite aussi de poudre donc le comportement rhéologique est complexe, où l'évolution de taille de grain influ celui-ci, pour trouver la combinaison obtimal, ca demande de réaliser des expériences... de nombreuses expériences... toutes ne sont pas fructueuses.

Alors on a besoin de mieux connaitre ce qui se passe à l'intérieur de la machine. Mais je vous déconseille de l'ouvrir toutes les deux secondes.
On peut aussi décider de simuler cette étapes... mais on reste limité à la modélisation que l'on en fait. Expérimentalement, on peut aussi faire des mesures... mais ici le problème c'est de réussir à revenir à la cause de ces observations.



<!-- . Son objectif mélanger et boyer différentes poudres d'uranium et de plutonium à la base de la fabrication des pastilles de combustible. -->

A priori, le fonctionnement ne semble pas plus compliqué que de laisser tourner votre machine à laver pendant quelques heures, ou bien votre mixeur pour faire votre mayonnaise.
Si aujourd'hui c'est aussi simple pour vous, il a bien fallu décider de la quantité de linge ou d'ingrédient à introduire, la durée, de la vitesse à prescrire... Et dans notre cas, on traite aussi de poudre donc le comportement rhéologique est complexe, où l'évolution de taille de grain influ celui-ci, pour trouver la combinaison obtimal, ca demande de réaliser des expériences... de nombreuses expériences... toutes ne sont pas fructueuses.



Eh bien le coeur de ma thèse a été de développer des méthodes pour confronter la simulation et l'expérience. Plus exactement, cela a été de mettre en place des méthodes d'assimilation de données adaptées au simulation et observation du broyeur. Cela consiste à mettre à jour l'état du système prédit (l'ébauche) avec les données mesurées avec pour objectif final: une estimation optimale de l'état de la simulation de mon système au cours du temps et des paramètres de modélisation. --> Mettre le schéma du début de ma thèse. 

Quels challenges dans mon cas ? Ca a été l'adaptation des méthodes classiques pour le type de simulation du milieu granulaire.

En effet, si en mécanique des solides on utilise généralement un maillage pour discrétiser notre milieu, ou bien une grille en mécanique des fluides. Dans notre cas on utilise une représenation particulaire.

Alors la problématique de 



Première réponse --> Schéma d'assimilation de données
  - Dire que l'on utilise la méthode EnKF 
  - Présenter le schéma de EnKF en mode graph

Deuxième question --> comment mettre à jour la configuration particulaire ? la grande question c'est de pouvoir mettre à jour la configuration d'une simulation particulaire
  - Alors présenter les développements actuels
  - Dire que l'on a une méthode qui va repasser par une grille de calcul intermédiaire 
  - Ou que l'on va directement pondérer les poids des particules qui existent déjà
  
Troisième question --> Le truc avec les méthodes particulaires c'est que les particules ne sont pas partout on voudrait pouvoir aligner les configurations
- En fait c'est ce que l'on veut faire 

## Test

Un endroit qui a toujours été un calvaire c'est celui de la laverie, mais imaginer ce que cela serait si il fallait paramétrer manuellement la quantité d'eau, de lessive, température, durée, tout ça sans pouvoir ouvrir ou arrêter la machine, condamné à essayer de comprendre ce qui se passe à l'intérieur... et réussir au bout d'un nombre incalculable d'essai à faire une chose aussi simple que de laver son linge. Alors oui si c'était comme cela je retourne directement au lavoir.

En fait cette problématique n'est pas si différentes de