# Notes Jumeau numérique

## SPL03 Predictive Digital Twins, Trond Kvamsdal
pour lui distinction entre

- Virtual Twin: Création d'une représentation virtuelle d'un actif physique ou d'un appareil
- Predictive Twin: Modèle basé sur la physique, les données, ou les deux, opérant sur le jumeau virtuel pour prédire le comportement de l'actif physique.
- Twin Projection: Intégration des connaissances générées par le jumeau prédictif dans les opérations et les processus

En ce basant sur **DNVGL-RP-A204** présente différents niveau de capacité:

- Indépendant
- Descriptif
- Diagnostique
- Prédictif
- Prescriptif
- Autonome
  
## Laura Mainini, Matteo
Mets en avant qu'il existe plusieurs définition de jumeau numérique. D'une part on peut le voir comme le fidèle le plus proche de son pendant réel

> The high-fidelity model of the system which can be used to emulate the actual system which can be used to emulate the actual system
>
> -- <cite> SEBok, 2022 </cite>

Mais également comme

> A set of virtual information constructs that mimics the structure, context, and behaviour of an individual/unique phhysical asset, is dynamically updated with data from its physical twin throughout its lifecycle, and informs decisions that realize value
>
> -- <cite> AIAA DEIC Position Paper, 2020 </cite>

Elle met l'accent sur la **valeur** du jumeau numérique définie comme la disponibilité et l'adoption du jumeau numérique vis-à-vis de sa capacité à fournir des prédictions fiable et en temps utile pour éclairer la décisions tout au long de la vie du produit.

Elle précise que les DT sont des **modèles**

Elle reprends le **principe d'utilité**
> All models are wrong, some are usefull
>
> -- <cite>Box 1976 </cite>

The time- and resource-efficiency requirements impose digital twins of a given physical system or process not to be unique, but **multifaceterd and purpose-driven models**

**Adaptive Nature**
> Physics based models conceived to continuously learn from data

La combinaison doit être spécifiée à partir d'une représentation mathématique d'une manière efficace et fondée sur des principes.

Ainsi un challenge est de pouvoir apprendre à partir de plusieurs sources d'information. C'est à dire à partir de :
- mesures des capteurs
- acquisitions de signaux, bases de données expérimentales
- simulations basées sur la physique
- modèle de substitution

Pour cela deux grandes méthodes: l'assimilation de données au travers de la calibration, de la fusion ou du filtrage ([Peherstorfer, 2018](<../../../Zotero/storage/G9P3PMTV/Peherstorfer et al. - 2018 - Survey of multifidelity methods in uncertainty pro.pdf>))
Les méthodes multifidélitées: reconnaître que de multiples représentations de systèmes et processus physiques donnés sont possibles à différents niveaux de précision et de coûts

offrent d'énormes possibilités de jouer sur plusieurs niveaux d'abstraction pour maximiser l'utilité par rapport aux tâches décisionnelles spécifiques à soutenir citer (Beran et al. 2020, Mainino et al. 2022)

Il y a aussi le challenge de pouvoir apprendre avec peu de données
Il faut donc des structures qui permettent d'apprendre avec un nombre limité d'observations.
D'une manière ou d'une autre caractérisé la fiabilité de la prédiction

L'apprentissage profond à la mode est gourmand en données et d'une fiabilité douteuse, ce qui limite considérablement son utilisation directe pour les substituts non intrusifs.

L'apprentissage soumis à des contraintes physiques exige des approches avancées qui pourraient idéalement intégrer des contraintes physiques dans le processus d'apprentissage. 
Par exemple par des méthodes de réduction d'ordre intrusif ou alors sous forme faible avec le paradigme des réseau de neurone physiquement informé.