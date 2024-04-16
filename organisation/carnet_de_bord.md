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
- [ ] Rédiger le début de la première partie de la démarche. C'est à dire celle lié à mon premier article.
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

## A FAIRE

- Redaction
- [ ] Reprendre le docx introduction et compléter les trous, les manques de justif avec les thèse de Luiza et Giraud
- [ ] Faire début abstract nouvel article
- [ ] Faire début chapitre 1 de ma démarche
- [ ] Faire partie méthodes de simulation du tambour.

- Code
- [ ] Ajouter du bruit aux mesures !!!
- [ ] Faire un fichier pour lancer les filtres
- [ ] Ajout de la visualisation des observations
- [ ] Faire le cas présenté par Olivier --> 2 vortex suffisamment éloigné sur un domaine infini. Mouvement de translation avec déformation des dipoles suffisammment faible intra vortex. J'imagine aussi faire un monome de bessel qui tourne grâce aux effets de bord (cas domaine fini).

- Cluster Inria

- [ ] créer un fichier SLURM. Test pour lambda program
- [ ] Faire la visualisation
- [ ] Faire le calcul d'erreur au cours du temps et faire l'affichage sur 1 seul graph. Cote à cote forward et assim. S'inspirer de ce que j'avais fait pour l'analyse paramétrique.

## A FAIRE++

- Le calcul du gradient optimisé