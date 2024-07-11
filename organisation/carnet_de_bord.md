# Carnet de bord

## 25-03-2024

- Finalisation de la formation science ouverte <!--formation-->
- Ajout de la formation risques RPS  <!--formation-->
- Ajout formation Rédiger sa thèse  <!--formation-->
- En fait ce que j'ai fait dimanche pour lambda c'était bien toujours du Bessel je n'avais pas mis à jour l'initialisation  <!--lambda-->
- Je lance d'abord le Bessel. On avait vu que dans ce cas la valeur opti était **0.002**, mais là je trouve plutôt **1**... Peut etre un changement dans les paramètres ? <!--lambda-->
  
```cpp
    bool pic = true;
    int nens = 24;
    int nalign = 12;
    int n_obs = 32;
    int nx = 100;
    double dp = M_PI / nx / 2;
```

- Je lance ensuite avec dipole <!--lambda-->
- Je prépare les filtres en définissant une classe mère, 2 classes filles et encore deux classes fille pour l'alignement <!--filtre_align-->

## 26-03-2024

- toute les formations ont été validée. 
- Vérification du lambda pour le cas dipole, a priori on est sur du **0.1** comme valeur. Par la suite on pourra faire le calcul du lambda optimal avec uniquement 3-4 membres. <!--filtre_align-->
  
```cpp
int init=4;
```

- [x] J'ai fini l'update du filtre remesh. Il faudra le tester
- [x] Faire la fonction d'alignement, comme je le fais pour plusieurs filtre en théorie, mettre cela dans la classe mère. **Il faut voir s'il ne faut pas perturber les prédictions**.
- [x] Faire small_align avec dipole. Il semble que le lmabda soit vraiment trop fort.<!--filtre_align-->
- [x] Rajoute outDir experiment type dans `InitEnsemble`. Ca marche bien.<!--filtre_align-->
- [x] Pour l'affichage de pot_alignment, ajout du choix du dossier 
- [x] Faire les différents filtre: pour cela fair une classe Mère pour tous les filtres. En commun le calcul de F, la fonction update. Il y aura des attributs différents bien sur. 
- A revoir demain la partie sur Introduction.
- Redaction partie Assim
- [x] Je relance le calcul du lambda pour dipole.Il faut aller plus bas en lambda

## 27-03-2024

- HCERES IRESNE accessible
- valoriser thèse pour l'industrie
  - parcours de l'inventeur à la DES
  - 3 min pour une invention 4 avril
  - innovation: mise en oeuvre d'une idée nouvelle
  - Magellan: programme de création d'entreprises ouvert aux docteurs (appel à idées, structuration , maturation, incubation, amorçage,...) pour avoir un projet robuste et résilient.
  - séminaire de la BPI
  - ex: Mathieu Darnajou, Jules Fermé
  - Thèse double projet: scientifique et professionnel
  - aller dans la section de l'intranet INNOVATION et VALORISATION
  - BPI pour devenir entrepreneur...
- Présentation des partenaires EDF

## 28-03-2024

- Deuxième journée des doctorants IRESNE
- présentation Framatome
- Marché des SMR: $\approx$ 20 entreprises avec 50 SMR
- [Nuclear on off](https://www.dunod.com/histoire-geographie-et-sciences-politiques/nucleaire-onoff-analyse-economique-d-un-pari-prix-marcel) livre interessant sur les cout du nucléaire
- dvlp ATF avec **PROtect**.
- [Retour d'expérience EPR](https://www.irsn.fr/sites/default/files/documents/expertise/rapports_expertise/surete/IRSN%202022%20Rapport%20technique%20CNDP%20REX%20EPR%20dans%20le%20monde.pdf) de l'IRSN
- Jérome Bigot
- Patrice GIORDANO - IRSN

## 29-03-2024

- Vérification du l-curve, il faut en effet plus de valeur en faible valeur de lambda pour essayer de faire apparaitre la l curve en log scale <!--lambda-->

## 01-04-2024

- [x] Lecture des intro de Luiza et Giraud et prise de note sur le tambour et la fabrication du combustible. Le garder asser sommaire ce n'est pas le coeur de mon sujet.<!--redaction-->

## 02-04-2024

- Lecture intro de Luiza
- Avancement sur la lecture première partie de Luiza pour Introduction générale <!--redaction-->
- Prévoir une partie comportement milieu granulaire. Assez général sur les mécanismes d'écoulement, c'est à dire les différents régimes et loi de comportement des régimes.
- avancement sur la partie introduction générale à finir cette après midi. Faire une introduction du projet ok. J'ai avancé jusqu'à la problématique il manque introduction assimilation de données.<!--redaction-->
- Mise en place du fichier run_assimilation.cpp, il y a un problème sur l'hérédité des classes et de la fonction virtuelle. Est ce que je peux pas juste l'enlever ? Regarder comment faire véritablement<!--cpp-->
- [x] Faire fonction forward
  
## 03-04-2024

- Enlever la fonction `virtual` pour voir si ça marche mieux
- Finalement fix en laissant `virtual` puis en rajoutant `override` pour les fonctions filles.
- J'avance sur l'implémentation du fichier d'assimilation.
- Problème sur la mémoire partagée, il faut que les membres soient mis à jour sur tous les rank. Il faut donc ajouter une étape de communication des données. A tester dans un premier temps avec le forward.
- Donc apparemment il faut définir au préalable des type de données MPI. Lorsque je fais la mise à jour des Membres il faut voir comment bien communiquer les informations... 
- Tester les filtres sur très peu de membre sans MPI
- Problème sur le remesh pour l'instant
- Pour le dx je détecte une erreur. A corriger sur l_curve, small_align et run_assimilation
- ok il faut vraiment faire des fonctions unitaires... ou alors déjà faire une vérification visuelle. Peut être préparer un export des solutions. On utilise les meme fonctions qu'avant mais cette fois 0 avant forward, 1 après forward 1 après assim.
- Je suis pas sur que pur le Remesh les particules soit au bon endroit
- Test sur le PartEnKF. Problème sur l'évaluation des membres...
- Lecture à faire du cours MPI de l'[IDRIS](http://www.idris.fr/media/formations/mpi/idrismpic.pdf).
- Faire la sauvegarde des solutions au cours du temps.

## 04-04-2024

- La structure des objets ne doit pas changer, ce qui doit être communiqué c'est uniquement ce qui change. Par exemple les particules, c'est à dire position x, y, et intensité. Les trois sont des `double`. On peut créer une fonction qui va exporter les données dans un format. Trouver la meilleure fonction dans le doc idriss.
- [x] Rédiger l'abstract du dernier article. S'inspirer de l'abstract et de ma dernière présentation.
- [x] Copier github sur le cluster Inria
- [x] Correction de la fonction `EvaluateFieldOnParti`.
- Debuggage de PartFilter
- Il faut maintenant faire la version MPI. Prévoir une fonction pour diffuser le calcul du processus 0 après le Forward et faire le Forward uniquement pour le processus 0. 

## 05-04-2024

- [x] écrire les fichiers de résultat au cours du temps.Mettre la fonction en question dans `utils.cpp`.
- [x] Ajouter une petite implémentation MPI pour cela.
- [x] Faire le transfert vectoriel avec Forward. Il faut pour cela.
- Il faut bien faire attention que chaque processus ait la meme longueur de vecteur. Pour cela, il est plus simple de prendre comme taille de message la longueur du plus grand nombre de particule. On fait donc des messages de NpartMax * 3 elements, le message final fait du NpartMax * 3 *nens, finalement... Ca ne marche que si tous les processus envoie le meme nombre de membres.
- L'autre possiblité c'est de calculer la longueur de chaque.
- La solution a été faite d'utiliser `MPI_Allgatherv`. Je définie les longueurs de chaque vecteur, le déplacement assolcié dans le vecteur de rassemblement. Il faut non seulement changer les propriétés des particules mais également le pas de temps (test du transfert).

## 08-04-2024

- [x] Vérifier que t est bien transféré
- [x] Implémenter la version MPI de l'alignement. Utiliser les fonctions de sérialisation précédemment défini.
- faire la visualisation 
  - [x] faire la création des dataframes, pour cela faire un grand dataframe par membre.
  - [x] Pour les membres, créer nstep `go.Trace` à afficher, pour ensuite les afficher avec la méthode défini [ici](https://plotly.com/python/sliders/).
- faire visualisaiton de l'erreur
  - [x] faire l'export dans le fichier .cpp, début ok mais atteintion au trace. Il faut simplement mettre fig en paramètre.

## 09-04-2024 

- [x] Faire le cas de Bessel un peu décalé
- Il semble qu'il y ait un problème dans le forecast au vu des résultats A priori c'est un problème dans le forward.
- Finalement, il y avait un problème dans le forward, le dernier pas de temps était mal calculé
- [x] Calcul de l'erreur 
- Faire attention au Remaillage, ça change le nombre de particules et donc complexifie les choses pour le MPI !!!
- [x] paralléliser calcul de l'erreur.
- [x] corriger alignment function
- MPI a l'air de bien marcher, on pourrait néanmoins tester de lancer le forecast uniquement avec le proc 0

## 10-04-2024 

- Il semble y avoir une erreur avec le calcul d'erreur. Sur le plot néanmoins on observe que : le forward a bien lieu sur chaque membre, que l'assimilation a aussi bien lieu sur chaque membre. Mais l'erreur ne correspond pas au résultat. On peut se demander pourquoi, à cause du calcul de l'erreur ? Est ce que les membres sont bien rassemblé sur chaque membre ? C'est important pour le calcul de l'erreur mais surtout pour savoir si chaque ensemble a bien tous les membres avec lui. C'est **ok**, en fait ref n'était pas calculé de partout
- J'ai pu load les modules, par contre pour ajouter les installations des headers package je n'y arrive pas

## Réunion 10-04-2024

- Cas à tester:
  - Alignement avec forecast + grand
  - Alignement avec erreur d'intensité -> juste alignement ? Quel est le meilleur estimateur pour une erreur d'intensité donné ? --> mettre une distribution de membre.

- Cas des tourbillons ponctuel --> petit support assez séparé (core size \circa 0.2 3 ou 4 équidistant sur un cercle) erreur position initial.
- Le faire sur un pas de temps suffisement long pour voir la divergence
- [x] afficher la variance
- [x] Faire le suivi de position des vortex pour pouvoir faire un affichage.
- [x] Ajouter les erreurs

1) On boucle pour que ça marche pour le cas variation de position sur 3 corps. Juste un problème d'alignement
2) Erreur de position reconstruite, position sur un seul graph. Afficher la position au cours du temps (calcul dans le forcast). Par exemple donner des attributs supplémentaires. Colorer les maillages, puis donner la couleur NN.
- On peut faire centre de chaque membre et ellipsoïde de confiance

1) Rédiger partie alignement pur
2) Cas même circulation mais distribution différente ? (taille de core (core size) différent) --> possiblement un cas ou ça peut justifier correction intensité en plus.
  - cas core size différent (mais même position), assimilation, centre ? surement ok, mais sur l'étallement des vortex --> regarder les moments d'ordre 2 de la vorticité -> est ce que l'on peut l'améliorer (matrice \sum \Gamma_i x_i**2, \sum \Gamma_i y_i**2, \sum \Gamma_i x_i y_i), montrer que l'on ne peut pas réduire pour l'ordre 1.

## 11-04-2024

- Afficher observations. **ok**.
- Il faut régler une histoire de seg fault, apparemment non lié aux affichages.... **ok**

## 12-04-2024

- Fait le cas 3 vortex
- Fait l'affichage de la variance
- Fait le suivi de la position d'un vortex
- Début de la coloration des particules. Mais il semble que la couleur ne reste pas, donc pas encore de résultats pour 3 vortex
- Correction sur la coloration des 3 vortex. Le problème venait de la sérialisation. Petit problème d'affichage avec plotly... mais on vera cela plus tard
- Test sur un alignement, pas de remaillage pour l'instant.
- [ ] faire la coloration après remaillage. Pour cela, il faut projeter la couleur sur la grille, puis faire une interpolation de la couleur. Un nearest neighbor doit suffire.

## 15-04-2024

- avancement rédaction mémoire sur écoulement dans le tambour et DEM.
- [ ] Afficher particules
- [x] Faire le remeshing
- [ ] Calcul de l'erreur d'observation et sur les positions.
- [x] Pour les couleurs: faire une moyenne. Faire 3 couleurs pour 0.

## 16-04-2024

- Commencer la rédaction partie Vortex Méthod. J'ai commencé la partie SPH aussi. Reprendre p37 et 38.
- Attention sur le include, ils faut mettre dans external les autres headrers !
- [x] Refaire correctement le cmake
- [x] Faire un enregistrement des paramètres directement avec un json
- Je viens de finaliser l'enregistrement des données d'expérience, il reste à mener les expérience maintenant.
- 2galement on prendra le temps de calculer l'erreru sur les positions ainsi que sur les observations. Pour les positions, je propose de le faire directement dans le python ?? et Pour les observations ca se questionne, en particulier dans le cas où le nombre vari. Donc dans ce second cas faire différemment.
- Egalement faire la mesure des moments d'ordre plus élevé.
- Il faut aussi tester sur Plafrim

## 17-04-2024

- [x] Reprise de la partie SPH (description). S'aider des p.37-38 + wiki.
- Erreur de position ok !
- Il faudrait faire plot de lambda pour différents sigma, différent lambda, différent nens et voir comment ça se comporte.
- Je peux lancer sur Plafrim mais... très lent encore. On doit bien choisir le type de noeud.

## 18-04-2024

- Retester sur Plafrim
- Refaire une rédaction de l'alignement
- lancer des l_curve en faisant varier sigma et nens pour le cas 3 vortex.
- Exporter et visualiser la position des particules
- Faire export des erreurs de vitesse. Faire une représentation des erreurs dans l'espace ? 
- Si j'ai le temps proposer le filtre alignement incrémental ?

## 19-04-2024

- [x] revoir plot assimilation, sur le chargement des fichiers (update df), enlever le point au centre
- [x] Refaire initialisation des trois vortex
- [x] faire varier la référence en changeant le poids de chaque vortex. Faire des test sur la référence seulement (nens=1, assimilate=0)
- [x] Mettre des bornes pour la recherche de paramètres a. Pour cela utiliser une première évaluation de la fonction cout.
- [ ] Ajouter une recherche multi-point (MLSL).
- [ ] Faire une calibration du lambda.
- [ ] Faire le calcul du déplacement max et mettre une contrainte. Dans la partie intégration faire l'intégration du champ de vitesse pour chaque particule et faire le max ? le mean ?
- [ ] Proposer un optimiseur qui prennent en compte les contraintes. Par exemple MMA ? Combiner avec MLSL ?
- L'assimilation marche bien (meme sans pénalisation mais avec des bornes.). Mais ça prend du temps, voir pour augmenter le dt forward pour que ça soit plus visuel sur la divergence


## 22-04-2024

- [ ] Save les vitesses de correction.
- Faire une sortie des optimizations pour voir si il y a fail. Pas si facile à faire avec le mpi.
- A priori il est bon de mettre une pénalisation car en mettant juste des bornes on a toujours un problème... Deux composantes 1) toujours des trajectoires fermées, 2) sensibilité au bruit ?
- Le deuxième point est à vérifier.
- Sans bruit et sans lambda :2024-04-22-10:35:36. Dans ce cas nens=8, il semble y avoir des compensation entre membre (un gro + et un gros -) --> en fait ça peut être juste pour faire un dipole.
- Dans le cas 2024-04-22-11:51:01, on a des cas extreme ou la vitesse est très importante. Bien que en moyenne on ait bien reduction de l'erreur sur la position des vortex et sur le champ de vorticité.
- Dans le cas `assim_three_vortex/2024-04-22-16:37:40` --> avec le lambda on a plus les champs qui partent dans tous les sens. Par contre on empeche trop le déplacement.
- Dans `assim_three_vortex/2024-04-22-16:52:05` --> super mais que 5 assim.
- Dans `assim_three_vortex/2024-04-22-17:01:40` : on a fait 10 assim, on voit que à la fin problème, soit le temps de forecast trop long soit, nombre de membre trop faible. ou alors lambda encore trop faible ?
- Dans `assim_three_vortex/2024-04-22-17:29:59`: on a bien fait 5 assim mais avec des données bruitées et tout va bien.
- Dans `/DISK2/md266594/part_enkf/outputs/assim_three_vortex/2024-04-22-17:40:24`: Ca marche bien avec 12 membres et 5 assim et le bruit.
- J'ai relancé un dernier cas pour voir si ça marche bien sur 10assim.


- On fait une assim sans bruit d'obs et avec un lambda
- [ ] faire export des a ?
- [x] faire un cas avec sans assim pour montrer l'évolution. Avec peu de membre (8)
- [x] Faire un cas avec moins de membre juste pour que ça aille plus vite.
- [x] Faire conversion animation vers mp4.
- [ ] Faire image champ de vitesse et vorticité pour l'initialisation

## 23-04-2024

- Il faut indubitablement de la régularisation. Introduire un prior sur u.
- Sur le cas `assim_three_vortex/2024-04-22-17:52:14`, on a rajouter le nombre de membres et toujours le même problème... Peut être le lambda est trop grand aussi ? Je teste avec moins de membres (n=8) mais un lambda plus petit.
- Dans `assim_three_vortex/2024-04-23-09:20:49`: J'ai repris un ensemble plus faible et un lambda moins fort mais toujours les meme problèmes. En regardant le membre 0, on observe que la vitesse du vortex problématique semble diminuer. Donc peut être concentration de tourbillon a diminué ?
- Je propose maintenant de modifier la fréquence de forecast: faire 20 assim de 5 unité de temps -> voir si c'est juste le déplacement le problème. (Ou alors augmenter le nombre de mesure ?)
- on a encore un problème meme en augmentant le nombre d'assimilation. En fait certain des membres disparaissent complètement...

- O peut etre reprendre le cas (1,1,1) mais
- J'ai repris un cs test plus gentil avec (1,1,1)
- Dans `forward_three_vortex/2024-04-23-15:57:48`: on a un forward sympa pour faire de l'assimilation.
- Dans assim_three_vortex/2024-04-23-17:00:10 on a un exemple qui marche bien avec peu de membres. Il y a toujours une petit bruit. Je vais donc augmenter le nobs pour voir si ça marche mieux. Mais en changeant le nobs, je change la taille du vecteur... donc normaliser ? On va changer le bruit pour l'instant. 
- Dans `assim_three_vortex/2024-04-23-17:48:38`: je fais un cas sans bruit de mesure. Alors l'erreur sur les centres diminu !
- Dans `assim_three_vortex/2024-04-23-18:02:17` : je fais avec un nombre de obs plus important. Mais pas de pondération, donc y'a une différence relative dans le lambda. Mais on voit bien une diminution de l'erreur !
- [x] régler le scaling sur nobs. changer le lambda en conséquence.

## 24-04-2024

- Dans  assim_three_vortex/2024-04-23-18:39:53 : on a refait avec plus de membres, mais on constate toujours autant de distorsions... Pas assez de régularisation ? En soit meme pour les cas précédent, il y avait pas assez de régularisation. Je vais donc reprendre des cas avec plus de régularisation pour voir l'effet. 
- Dans `/DISK2/md266594/part_enkf/outputs/assim_three_vortex/2024-04-24-09:52:15` :  lambda = 1.e-6, on a aug le lambda. L'erreur est moins réduit, mais pas trop d'écart, on peut plutot le diminuer
- Dans `/DISK2/md266594/part_enkf/outputs/assim_three_vortex/2024-04-24-10:08:27` : on a lambda = 1.0e-7, on est pas si mal, pas mal de distorsion. quand meme.
- En fait jusqu'à présent pas de remeshing.... Je refais un test en forward pour voir si ça marche maintenant.
- remeshing is fixed
- Je fais 1 seul remesh pendant le forward
- J'ai réussi à faire une bonne coloration après le remesh. Correction d'un petit bug dans la recherche dans la matrice.
- Test de l'assimilation après avoir refait le forward sans problème.
- [x] export des membres sans assim, export du champ de vorticité initial et les champs de vitesse initiaux.

## 25-04-2024

- Correction sur la base des champs de vitesse. En fait jusqu'à présent on corrigeait que grâce à la base initiale... En utilisant la vraie base on corrige beaucoup moins bien les retards.
- Dans `assim_three_vortex/2024-04-25-10:54:40` on a mis à jour la base, dans ce cas précis, on arrive à corriger au début convenablement, mais finalement on n'arrive plus à corriger les déphasage sur la trajectoire, car vitesse pas assez riche...
- Peut être enrichir au fur et à mesure la base ? la mettre à jour mettre celle au début du forecast puis à la fin ?
- Dans `assim_three_vortex/2024-04-25-11:16:23`, je propose déjà d'enlever le champ moyen. Y'à une amélioration mais je pense que c'est juste du au rapport à la régularisaiton... On assimile bien mais juste parce que l'on peut toujours compenser en norme de vitesse
- Dans `assim_three_vortex/2024-04-25-11:28:28` un premier temps je vais utiliser à chaque fois le champ de vitesse qui précède
- Dans , on garde donc la base de vitesse précédente, on centre bien par le champ moyen.
- [x] Correct basis print
- Dans `assim_three_vortex/2024-04-25-17:25:02` J'ai proposé une nouvelle façon d'écrire la base. On peut enrichir avec les modes précédents.
- Dans `/DISK2/md266594/part_enkf/outputs/assim_three_vortex/2024-04-25-17:40:08` Je propose de faire un test avec uniquement le champ courant mais cette fois avec moins de régularisation. On a un résultat acceptable ^^. On test  avec l'enrichissement ?
- Pour la rentrer finir moment 2.

## 13-05-2024

- [x] après discussion avec Olivier, ajouter le terme moyen dans la base comme un terme supplémentaire, c'est à dire écrire correction comme $v = \sum_{i=1}^N \alpha_i u_{i}' + \alpha_0 \bar u$ où les $u'_i$ sont les membres centrés.
- [x] voir sur ADUM formation DD --> Rien pour l'instant
- [x] faire slides PLATON --> reprendre dernière slide peut être mettre à jour le dernier cas test ?
- Réécrire la mise à jour
- 
## Team Meeting

Nina Delette (PhD), Vittero Piro (Intern).
Concours CRCN
Hausdorff distance
Bootstrapping for confidence intervals

## 14-05-2024

- Relancer cas test avec la vraie base, bien réécrire pour voir le noeud du problème.
- Prendre en main la présentation Beamer du CEA
- [ ] préparer plan ECCOMAS
- [x] Faire le calcul de l'erreur de moment 2
- [x] Faire la normalisation de la norme du champ de vitesse --> ca avait déjà été fait
- Dans `outputs/assim_three_vortex/2024-05-14-09:57:22`: j'ajoute le champ de vitesse moyen, ça semble bien marcher, mais au regard du champ d'alignement, il semble que la composante moyenne soit trop exprimée.

## 15-05-2024

- Dans , je double la fréquence d'assimilation --> meilleursrésultat.
- Dans `assim_three_vortex/2024-05-15-10:30:00`, je double le nombre de membre --> meilleurs résultat.
- Peut être suffisant de ne faire que 5 assimilations ?
- J'ai retiré l'export de la position des centres juste à la fin pour éviter une superposition avec l'analyse.
- J'ai changé la définition de la base. Je reprends tous les membres de manière équitable
- Dans la présentation justifaction de la pénalisation --> on pénalise les coefficients. L'idée c'est d'éviter un déplacement de particules moyens trop élevé. Donc on pénalise le champ de vitesse u. Comment en pénalisant les composantes ?
  
## 16-05-2024

- Faire les slides sur la dernière partie. Dire comment on souhaite corriger sur la première slide (hypothèse, but, moyens). Puis slide qui présente la transformation avec qq notations, puis le problème d'optimisation. Phrase de transition sur le choix de l'espace de recherche. Après définition de l'espace, on reformule le problème d'optimisation dans la base.
- [x] Faire un cas avec des *core size* différents (ajouter une distribution, cas 311).
- [x] Répondre aux mails perso.
- Dans `/DISK2/md266594/part_enkf/outputs/assim_three_vortex/2024-05-15-18:08:02`, avec 32 membres et pas dans l'espace de perturbation. Ca marche assez bien. Donc on pénalise de la meme manière chaque membre.
- [ ] Faire l'export des coeffients a du champ de correction. Faire visualisation des différents champs. Faire l'orthogonalisaiton en python.
- [x] Faire la slide EnKF en affichant progressivement forecast - Observation - analyses...
- [ ] représenter la distribution de vorticité suivant l'initialisation.
- [x] Faire les cas sans assimilation

## 17-05-2024

- Hier ai fait les cas sans assimilaiton du problème et avec assimilation. On observe que arpès un réaligment, la différence de position est une erreur d'avance ou de retard sur la trajectoire totale. Penser à faire un cas différent pour voir le comportement ? Par exemple le dipole ?
- Faire les slides --> voir idées carnet de note. D'abord sur la partie alignement.

## 21-05-2024
- avancement sur les slides
- Faire la mise à jour avec champs avant après pour la mise à jour.

## 22-05-2024
- [ ] Fin des slides pour l'instant. Envoie à Michel et Olivier
- [ ] Faire un cas de dipole avec initialisation seulement un ecart sur Amplitude et Rayon mais pas position. Faire une seule assimilation pour commencer.
- [x] Pour le dipole, coloré suivant que le tourbillon soit positif ou négatif.
- [x] Faire une meilleur calibration du lambda.
- J'ai refait des initialisation pour le dipole. J'ai des résultats interessant pour les test 21, 22, 23. Je trouve le cas 23 assez interessant. Dans cette situation définir la base avec le début et la fin me semble interessant.
- [ ] revoir le calcul de la projection avec noyaux gaussien.
- [ ] Faire le calcul de l'erreur sur les observations de la vitesse. Pour cela il faudrait la vitesse débruité ?
- [ ] Voir pour faire l'export des coefficients, regarder les champs de vitesse. Analyse des champs dans le fichier `velocity_analyzer.py`

## 23-05-2024

- Avancer sur l'article ou sur la partie vortex method du manuscrit $\rightarrow$. J'ai revu VM et maintenant il faut voir MPM
- Revu velocity analyzer. Une svd semble assez interessante
- Voir pour faire de la pénalisation avec le prior, est ce que ça peut marcher ???
- J'ai vu que jusqu'à présent je ne mettais pas à jour la base avec le fichier json... Donc à retester pour `extended`.
- Avancement sur le filtre d'alignement en prenant le prior mais aussi avec la version incrémentale à tester toutes deux. 

## 24-05-2024

- Avancer jusqu'à MPM et faire un peu d'article 
- Faire la version prior de l'alignement
- Voir pour faire la version incrémentale aussi ? Petit test ?? Il faut alors refaire la fonction MemberAlign, peut être memberALignInc.
- Ok ça a l'air de marcher, à voir pour modifier le Inc pour avoir l'enriched. l'inversion de P prend trop de temps.

## 27-05-2024

- Présentation blanche ce matin. Voici quelques modifications à faire:
  - [x] Rajouter le logo polytechnique
  - Dans les premières slides éviter les répétitions. En particulier celles qui parlent de l'assimilation de données EnKF est répété (use abbréviation), Sequential filtering, Data assimilation.
  - [ ] Sur la slide intensity correction limitation, illustrer le problem du support de particules en colorant la position des autres particules --> Fonction pour faire export du support et du convexe des particules.
  - Dans la slide application define clearly what is illustrate
  - Présenter le cas où les amplitudes sont incertaines, présenter le cas où elles ne sont pas.
  - Peut être faire l'animation du cas de référence avec les particules --> done with `export_particles_frame`
  - Présenter le cas où les intensités ne sont pas aléatoire.
- Après avoir fini les slides, reprendre le cas part EnKf avec le dernier exemple, coder le code en question en cpp.
- Dans part enkf faire mise à jour des quantités particulaires.

## 28-05-2024

- Reprise du part enkf 
- Faire les slides mise à jour
- Donner un code couleur pour intensité et position

## 29-05-2024

- Modifications posible à faire:
  - Slide "position update à Goal, mettre directement l'image d'un des vortex qui se fait corriger la position. Pour cela, je propose de montrer les particules avant, les particules après avec le champ de vitesse. Peut être mettre deux images successives. Dans ce cas enlever le texte de cette slide et le garder uniquement dans la slide suivante.
  - Du coup retirer position transformation.
  - Laisser la slide searching space.
  - Rajouter le cas test où juste la position est incertaine.

## 30-05-2024

- [x] Faire le run avec PartEnKF
- [x] Faire le code pour Part-Align-EnKF
  
## 31-05-2024

- Continuer la présentation. Reprendre note de la réunion avec Olivier.
- [ ] Faire l'export du champ d'alignement
- [ ] Faire les test Part-EnKF, Align-EnKF, Part-Align-EnKF

- [ ] Tester de faire le Remesh-ENKF

## 02-06-2024

- Présentation à ECCOMAS2024
- Machine Learning for the Inverse Design of Architected Materials: interessant présente des cas de méthodes inverses pour des designs. Utilise stable diffusion.
- Parameterized hyperelastic material modeling and multiscale topology optimization with physics-augmented neural networks: Utilise des PolyConvex Neural network. Ajoute une paramétrisation.
- Idée: tester le cas de vortex de taylor

## 03-06-2024

- Initialization du green vortex
- benchmark_nproc.cpp to launch
- Presentation on hard constraints algo
- GENERIC: Ottinger 2005 and ROmero 2009 for Computational Mechanicss. With this system conservation of energy and increase of entropy
- Y.Zhu Particle optimization to find a global optimizer ? With graident free method with consensus based optimization.
- Beaucoup de méthode CBO (consensus based optimization)
- Elisa Incomini: Multiobj with filtering methods. Case of inverse problem setting. Multiobjective = several inverse problem (best machine to cut diff materials).

## 13-06-2024

- Formation sur les débouchés du doctorat
- Voir les [notes](../formations/dvlp_pro/notes.md)

## 14-06-2024

- [x] Faire ADUM
- Présentation Café thésard --> todo
- Réservation train --> in progress
- Envoyer un mail pour récupérer le certificat cours particles --> in progress
- Faire la liste du jury potentiel --> in progress

- Commencer présentation CSI --> power point ?
- Commencer présentation  --> en latex. S'inspirer de la conf.

## 17-06-2024

- Faire plan Café thésard
- Faire plan CSI
- [x] Faire résumé Jumeau numérique à partir de la conf pour le manuscrit
- [ ] Vérifier la parallélisation du calcul du gradient. Revoir le calcul du gradient.

- Open mp ne semble pas efficace... 

## 19-06-2024

- Avancement sur Remesh-EnKF avec les couleurs
- Test sur l'assimilation
- finalisation de la présentation CSI

## 20-06-2024

- Faire un fichier pour faire varier certains paramètres. Proposer un code qui puisse être appellé comme
  `./run_benckmark -p parameters.json -i nens -v 10 20 40 (+ le filtre à utiliser)
  -i : nens, std_noise
- Avancer sur la présentation café thésard
- Vérifier les résultats de RemeshEnKF:
  - dans `outputs/assim_three_vortex/2024-06-19-17:32:51` test avec succès de Remesh-EnKF 
- Faire le plan de la partie 1.
- Faire la slide MPM - DEM et DA --> beginning and end, c'est à dire présenter les simulations et les moyens d'appliquer les méthodes d'assimilation.

## 24-06-2024

- [x] relire entretien de fin d'année
- [x] Revoir le plan précis du café thésard

## 25-06-2024

- [x] préparer réunion de suivi faire un petit latex ? : mettre le planning, parler des derniers jalons: finalisation d'une dernière étude (mettre qq slides), présentation à ECCOMAS, passage du CSI, préparation du Café-Thésard.
- [x] Entretien annuel
- [ ] Finaliser la présentation café-thésard

## 26-06-2024

- [x] Finaliser présentation café thésard --> revoir animation du remesh_enkf (rajouter une visualization du support de particules ?)
- [x] Voir erreur de plot sigma_obs
- [ ] Il faut prendre en compte sigma_obs dans le problème d'alignement

## 27-06-2024

- [x] Finir la presentation café thésard !!!
- [x] voir dernier résultats et relancer avec les filtres align --> voir pour faire la regression
- [x] Faire état de frais
- [ ] Regarder le plan de la partie 1 + partie application
- [ ] Faire le CV européen (soir)
- [ ] Faire une assimilation avec le filtre align en faisant varier lambda --> pour montrer le choix de l'hyperparamètre. Pour cela faire un 
- [ ] Rajouter l'erreur sur les centre de tourbillon dans le benchmark! --> les sauvegarde sont bien faite.

## 28-06-2024

- Présentation au café thésard. Découverte d'un mémoire de thèse sur filtre EnKF et méthode vortex. Toujours une définition de l'état inadéquat.
- problème de convergence sur le align --> voir pour de la régularisation ?, c'est peut être ça qui explique la lenteur. Donc pour l'instant attention aux résultats du dossier align ou align_remesh
- Donc on lance la calibration du lambda
- voir la dépendance au bruit de mesure

## 01-07-2024

- Reprise de la partie Remesh EnKF ce matin
- [ ] Revoir le filtre part-EnKF --> voir le comportement, pour ça marche bien ?
- [ ] Pour l'étude paramétrique faire la fonction qui compare l'erreur de position --> faire une fonction d'agglomération à chaque fin d'assimilation ?
 
## 03-07-2024

- [x] finir le CV, europass ?
- [x] faire cover letter
- [ ] Faire test en changeant sigma
- [ ] Faire test en changeant lambda --> reprendre ancien script
- [ ] Avancer sur la partie PartEnKF --> méthode, regression, algo.
- [ ] refaire lcurve avec un fichier de paramètre en entrée

## 04-07-2024

- [ ] relire CV et cover letter (9-10h)
- [ ] revoir l'entete du lcurve (10-11h)
- [ ] faire partie part-enkf (11h-18h)

## 08-07-2024

- Avancé sur la partie Part-EnKF. Faire le chapeau en reprenant l'introduction de l'article
- Reprise Vortex in Cell
  
## 09-07-2024
- MPM en lisant livre Olivier. Texte MPM à nettoyer.
- Analyser les résutlats de calibration du lambda -> premier plot et relance d'une série de calcul à 10:26 le 09/07
- J'ai trouvé des informations sur la calibration avec la l curve, ici un très bon papier explicatif sur la [courbure](https://www.sintef.no/globalassets/project/evitameeting/2005/lcurve.pdf) et là une [implémentation python](https://github.com/eric-brandao/lcurve/tree/master)
- De plus comme on a une idée de la valeur de l'erreur de $b$ comme nous la fixons, alors il pourrait être préférable d'utiliser la méthode de [discrepency](https://www.imm.dtu.dk/~pcha/DIP/chap5.pdf), voir une des autres méthodes proposées. On peut continuer à faire tourner les calculs néanmoins.
- Dans ce cas on cherche la valeur d'intersection entre le data missfit et le niveau de bruit. Dans notre cas data missfit est normalisé par $n_obs$, donc l'espérance du bruit vaut directement $\mathbb E [\|\eta\|] = \sigma^2$. 
- Dans ce cas il suffit de regarder quel est le lambda pour lequel le data missfit intersect le niveau de bruit.
- Relire la partie bibliographie et le plan générale
- Faire la partie application (chapitre 2) application 1d et 2d.

## 10-07-2024

- Faire le bilan de l'application 1d puis 2d, voir pour ajouter également la calibration des paramètre
- Faire une précision sur VIC
- Finir MPM
- Faire un doc bilan sur l'avancement
- Répondre à l'anonce de poste IRSN
- Faire validation des cours de ADUM --> voir qui prévenir ?
  
- Palaiseau Theorical Spectroscopy Group
  The quantum mony-body problem : $H \psy_\lamnda(x) = E_\lambda \psy_\lambda(x)$, x of size Nx^3
  Triple compléxité: interaction, état quantique et un vrai matériau
  Application optical absorption
  Travaille sur les observables --> c'est à dire l'intégrale de l'équation
  $O = \tilde O [Q]$, où $Q$ remplace la fonction d'onde, décrit complètement l'observable mais est plus simple.
  ex: en dft, $Q$ est la densité electronique, l'observable est l'nergie totale: E[n].
  - Filippo Vicentini, also on ML for quantum physics
  objectif est de passer d'une compexité exp à polynomiale
  sur l'approximation universelle voir Cybenko et Leshno.
  Et voir Lu et al pour la profondeur du réseau.
  - They also use transformers.
  - Marylou Gabrié, CMAP: Assisting sampling of physical systems with generative models
  - sampling cause the world is a statistical distribution.
  - ex: statistical mechanics : $\rho(x) = \exp(-\beta U(x))/ Z_\beta$ ; or Bayesian inference.
  - obj : trouver macro statistic (ex espectation)
  - utilise MCMC, voir 2004 Liu handbook on mcmc
  - degenerate case of MCMC: no mixing case ! 
  - use generative modelling pour y répondre
  - generative give a way to easily generate samples of a distribution
  - issues: fake (voir Ali Borji, Image and Vision Computing 2023) ; comment obtenir la base de données initiale ? Sachant qu'on a que la densité que l'on veut échantillonner.
  - Présente Normalizing Flow
  - Voir Noé, Boltzmann Generators
  - application en inférence bayésienne en astrophysique.
  - voir package [FlowMC](https://flowmc.readthedocs.io/en/main/)
  - application [DFT](https://en.wikipedia.org/wiki/Machine-learned_interatomic_potential)
  - Quantum Physics for Machine Learning, Danijela Markovic
  - prle de reservoir nodes
  - outre des qbits, ils utilisent des oscillateurs quantiques
  - Understanding Uncertainty in  Machine Learning with tractable model, Bruno Loureiro of ENS-CNRS.
  - rappel que pour un nombre grand de données, la maximum lilihod tend vers une distribution en N(0, F(\theta)^{-1}) / \sqrt(n).
  - Présente des reliability diagram pour presenter méthode de calibration
  - Montre que en machine learning il y a de l'overconfidence
  - Pour améliorer: utiliser deep ensembles, bnn, droupout...
- - MLE suffer from overconfidence in high-dimension, regularisation and cross validation can help
- Present the Empirical Bayes classifier or Laplace classifier
- Temperature scaling: very good
- Another presentation about RBM (restricted boltzmann machine)
- Geometric learning, use point cloud data --> unordered and sparse (Mathieur Melennec) for high energy physics
- Rudy Morel: present impressive field generation of diffrent fieldwant to use foundation models
- Present **the Well** to mix different operators from differnt dataset

- [x] Répondre à l'anonce de poste IRSN
- [x] Faire validation des cours de ADUM --> voir qui prévenir ?
  
## 11-07-2024

- [ ] Faire le bilan de l'application 1d puis 2d, voir pour ajouter également la calibration des paramètre
- [x] Faire une précision sur VIC
- [x] Finir MPM
- [x] Faire un doc **bilan sur l'avancement**

- Riwal Plougonven (Lab Météo Dnamique) (work of Sothea HAS)
- Voir papier Bauer nature 2015
- Main difficulty in NWP --> cloud and water cycle
- gravity waves : T=10min - 2 days, like water but ici différence de densité entre les airs est bien moindre.
- origine: montagne et convection
- en fait cré des effets non locaux de la dissiption par déplacement de flux en altitude
- Florence Tupin: Telecom, Radar imaging (gitlab ring), aller voir SWOT and BIOMASS mission, voir Infoterra and Astrium, voir Total Variation Denoising, alternating Direction method of multiplier
- Julien Le Sommer: comb physics & ML in hybrid climate models
- Neural incremental data assimilation, Mathieu Blancke: use re analyse dataset ERA5 (Munoz-Sabater)

### A FAIRE

- Redaction
- [ ] Reprendre le docx introduction et compléter les trous, les manques de justif avec les thèse de Luiza et Giraud
- [ ] Faire début abstract nouvel article
- [ ] Faire début chapitre 1 de ma démarche
- [ ] Faire partie méthodes de simulation du tambour.

- Code
- [x] Ajouter du bruit aux mesures !!!
- [x] Faire un fichier pour lancer les filtres
- [x] Ajout de la visualisation des observations
- [ ] Faire le cas présenté par Olivier --> 2 vortex suffisamment éloigné sur un domaine infini. Mouvement de translation avec déformation des dipoles suffisammment faible intra vortex. J'imagine aussi faire un monome de bessel qui tourne grâce aux effets de bord (cas domaine fini).

- Cluster Inria

- [x] créer un fichier SLURM. Test pour lambda program
- [ ] Faire le calcul d'erreur au cours du temps et faire l'affichage sur 1 seul graph. Cote à cote forward et assim. S'inspirer de ce que j'avais fait pour l'analyse paramétrique.

### A FAIRE++

- Le calcul du gradient optimisé