---
title: Plan Manuscript
author: Marius Duvillard
---

# 1- Introduction / Bibliographie
## 1.1 Contexte industriel
### 1.1.1 Fabrication du combustible de fission
- voir Giraud: p.1-6
- voir Orozco: p.3-9

### 1.1.2 Broyeur à boulet
- Orozco ?
  
### 1.1.3 régimes d'écoulement
- voir pouliquen.pdf
- voir Orozco
<!-- ### indices de mélange
voir Giraud -->

### 1.1.4 Méthode de simulation des écoulements granulaires dans un tambour en rotation
- voir Arseni 2020
- voir EFEM
- Mishra / Orozco / Chong / Chandra / Zuo / Zhu

### 1.1.5 Méthodes de mesures
- voir Bastien + dossier mesures
<!-- biblio -->
### 1.1.6 Concept de Jumeau Numérique
- voir session FJOH

## 1.1 Méthodes particulaires
- Présenter les méthodes continues et discrètes (voir cours PARTICLES)

### 1.1.1 Présentation DEM
  
### 1.1.2 Méthode SPH
<!-- ###  1.1.2 Présentation méthodes continues voir généralité: noyau, discrétisation particulaire -->
### 1.1.3 Méthode MPM-PIC
### 1.1.4 Méthode VM --> problème fluide incompressible et similarité avec SPH / VIC et MPM

## 1.2 Assimilation de données
<!-- 1.2.1 Généralités: présenter un cas 1D pour expliquer le BLUE -->
- cas 1D: x:température dans une salle, y: mesure de plusieurs thermomètre p21 Carpentier, voir Blayo, an introduction to data assimilation. Présenter les résultats de Blayo s.8-19.
- 
### 1.2.1 Modèle stochastique du système
- inspérer de 3.4.2 de Asch, et Carpentier p.41

### 1.2.2 Probability formula

### 1.2.3 Estimation 
- Carpentier, chap 2, p27 -36
- Asch p.78-82
- Evensen 2.1.7 inférence bayésienne

### 1.2.4 Filtre Bayésien
- Carpentier p42
- Asch p 91
- Evensen 2.2

### 1.2.5 Filtre particulaire
- 3.7 de Asch
- CoursEC section 5

### 1.2.7 Formulation variationnelle

### 1.2.6 Filtre de Kalman

### 1.2.8 Filtre de Kalman d'Ensemble
- Bocquet, Lecture 2
- CoursEC 7.2

### 1.2.9 Méthodes Hybrides - RML

# 2 Ensemble Data Assimilation pour la simulation particulaire - Article 1

## 2.1 Filtre de Kalman d'Ensemble 
--> choix d'une formulation in ensemble space à partir des mesures

## 2.2 Focus approximation des méthodes particulaires 
--> approximation et regression

## 2.3 Schéma de remaillage 
--> Redistribution

## 2.4 Focus problème VM 
--> Cas test

## 2.5 Filtres adaptés

# 3 Data Assimilation: modification de la distribution particulaire
--> Placer la biblio dans la partie 1.2 si associée à DA ou dans un 1.3 si trop dfférent (ex: OT)

# 4 Conclusion