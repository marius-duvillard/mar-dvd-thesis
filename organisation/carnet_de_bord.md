# Carnet de bord

##03-25-2024:
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

##03-26-2024
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
[x] Je relance le calcul du lambda pour dipole.Il faut aller plus bas en lambda


## A FAIRE
- [ ] Reprendre le docx introduction et compléter les trous, les manques de justif avec les thèse de Luiza et Giraud
- [ ] Faire une fonction forward
- [ ] Ajout de la visualisation des observations
- [ ] Lecture des intro de Luiza et Giraud
- [ ] Faire fonction forward
- [ ] Faire fonction PartApprox
- [ ] Faire filtre juste Alignment
- [ ] Copier github sur le cluster Inria
- [ ] créer un fichier SLURM

## A FAIRE++
- Le calcul du gradient optimisé