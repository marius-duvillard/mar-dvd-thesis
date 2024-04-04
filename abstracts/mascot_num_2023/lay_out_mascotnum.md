# Abstract lay out

## Contexte 

1 Assimilation de données
- Les méthodes d'assimilation de données sont des méthodes probabilistes qui permettent de mettre à jour l'état d'un modèle de simulation à partir de données d'observation.
- Ces méthodes sont très utilisées en météorologie ou des 
- On compte 3 grandes familles de méthode d'assmiliation de données : Les approches variationnelles qui se basent sur la minimisation d'une fonctionnelle, les méthodes proet les méthodes hybrid 
- 

2 Méthodes particulaires
- Ce sont des méthodes de résolution sans maillage qui se basent sur des ensembles de particules auxquelles sont associée des quantités pour discrétiser des champs continues. Ces méthodes sont particuliairement propices à des problèmes d'advection et de grandes transformations tout en conserv. 
- Parmi ces méthodes on peut en particulier citer la méthode SPH et la méthode MPM.



## Problématique

Si la représentation particulaire offrent ces avantages, elle complexifie grandement l'application de méthode d'assimilation de d'ensemble en représentant des états sur des ensembles de particules différentes. 
- On propose de présenter des méthodes d'assimilation pour des simulations particulaires.
- Des méthodes d'assimilation de données ont déjà pu être appliquées pour assimiler des observations lagrangiennes, issues par exemple d'un flotteur (mettre ref.), et même appliqué à des méthodes particulaires de type méthode vortex (mettre ref.). Néanmoins ces méthodes sont limités dans le sens où elles ne peuvent s'appliquer à des cas où le nombre de particules est différentes. 
- Dans cette présentation, nous souhaitons mettre en avant une nouvelle méthode d'assimilation de données hybride utilisant à la fois un ensemble pour estimer l'erreur de modèle et l'hypothèse RML (mettre ref.) pour mettre à jour l'ensemble.
Nous commencerons par faire le lien entre méthode d'ensemble et processus gaussien, nous montrerons ensuite que le problème d'assimilation de données que nous proposons se définie par une méthode d'échantillonnage pour l'estimation de l'erreur de modèle et par le choix de la position de nouvelle particule.
Nous présenterons nos résultats sur des exemples 1d et 2d d'advection.

