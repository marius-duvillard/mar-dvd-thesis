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
- Rédiger l'abstract du dernier article. S'inspirer de l'abstract et de ma dernière présentation.
- 
  
## A FAIRE

- Redaction
- [ ] Reprendre le docx introduction et compléter les trous, les manques de justif avec les thèse de Luiza et Giraud
- [ ] Faire début abstract nouvel article
- [ ] Faire début chapitre 1 de ma démarche

- Code
- [ ] Faire un fichier pour lancer les filtres
- [ ] Ajout de la visualisation des observations
- [ ] Faire la sauvegarde des solutions au cours du temps.
- [ ] Faire le cas présenté par Olivier --> 2 vortex suffisamment éloigné sur un domaine infini. Mouvement de translation avec déformation des dipoles suffisammment faible intra vortex. J'imagine aussi faire un monome de bessel qui tourne grâce aux effets de bord (cas domaine fini).
- [ ] Corriger MPI. Proposer des structures de données adéquates. ou alors en sauvegardant les fichiers sans utiliser le Message passing

- Cluster Inria
- [ ] Copier github sur le cluster Inria
- [ ] créer un fichier SLURM


## A FAIRE++

- Le calcul du gradient optimisé