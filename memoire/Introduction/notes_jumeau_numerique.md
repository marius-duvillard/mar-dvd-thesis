# Notes Jumeau numérique

Le jumeau numérique est une réplique virtuelle d'un système physique, permettant de simuler, d'analyser et de prédire le comportement du système physique en temps réel. Ce modèle numérique intègre des données dynamiques et historiques, permettant une représentation précise et synchronisée dans le temps. Dans le contexte industriel, les jumeaux numériques utilisent l'intelligence artificielle (IA), l'analyse de données, et les capteurs physiques pour améliorer la compréhension des processus et faciliter la prise de décisions.

\subsection{Apport du jumeau numérique pour le broyeur à boulet}
Apport 1 : compréhension du procédé
Le jumeau numérique permet de comprendre les phénomènes se déroulant à l'intérieur du broyeur à boulets, sans avoir à l'ouvrir. Il permet ainsi d'extraire de l'information quant aux mécanismes se déroulant lors de la comminution.

Apport 2 : optimisation du processus de broyage
Le jumeau numérique du broyeur à boulets permet d'analyser et de simuler le processus de broyage en temps réel. Il peut prédire l'efficacité du broyage, le degré de mélange des matériaux, et les impacts des variables opérationnelles comme la vitesse de rotation et le taux de remplissage des boules. Cela aide à optimiser les paramètres de fonctionnement pour obtenir un mélange homogène et efficace. En particulier, un apprentissage par renforcement permet de construire un modèle capable d'optimiser les paramètres du procédé en temps réel.

Apport 3 : maintenance prédictive
En surveillant l'état du broyeur à boulets, le jumeau numérique peut prédire les besoins de maintenance avant que les défaillances ne surviennent. Cela réduit les temps d'arrêt imprévus, augmente la durée de vie de l'équipement et assure une production continue et fiable.

Apport 4 : contrôle de la qualité du produit
La précision du jumeau numérique dans la modélisation du processus de broyage aide à garantir que le combustible MOX répond aux normes de qualité attendues.


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

Biblio: 


@article{chinesta_virtual_2020,
	title = {Virtual, {Digital} and {Hybrid} {Twins}: {A} {New} {Paradigm} in {Data}-{Based} {Engineering} and {Engineered} {Data}},
	volume = {27},
	issn = {1134-3060, 1886-1784},
	shorttitle = {Virtual, {Digital} and {Hybrid} {Twins}},
	doi = {10.1007/s11831-018-9301-4},
	language = {en},
	number = {1},
	urldate = {2022-06-20},
	journal = {Archives of Computational Methods in Engineering},
	author = {Chinesta, Francisco and Cueto, Elias and Abisset-Chavanne, Emmanuelle and Duval, Jean Louis and Khaldi, Fouad El},
	month = jan,
	year = {2020},
	pages = {105--134},
}
