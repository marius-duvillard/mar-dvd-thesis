---
title: Plan Manuscript
author: Marius Duvillard
---

- [1- Introduction / Bibliographie](#1--introduction--bibliographie)
  - [1.1 Contexte industriel](#11-contexte-industriel)
    - [1.1.1 Fabrication du combustible de fission](#111-fabrication-du-combustible-de-fission)
    - [1.1.2 Broyeur à boulet](#112-broyeur-à-boulet)
    - [1.1.3 régimes d'écoulement](#113-régimes-découlement)
    - [1.1.4 Méthode de simulation des écoulements granulaires dans un tambour en rotation](#114-méthode-de-simulation-des-écoulements-granulaires-dans-un-tambour-en-rotation)
    - [1.1.5 Méthodes de mesures](#115-méthodes-de-mesures)
    - [1.1.6 Concept de Jumeau Numérique](#116-concept-de-jumeau-numérique)
  - [1.1 Méthodes particulaires](#11-méthodes-particulaires)
    - [1.1.1 Présentation DEM](#111-présentation-dem)
    - [1.1.2 Méthode SPH](#112-méthode-sph)
    - [1.1.3 Méthode MPM-PIC](#113-méthode-mpm-pic)
    - [1.1.4 Méthode VM --\> problème fluide incompressible et similarité avec SPH / VIC et MPM](#114-méthode-vm----problème-fluide-incompressible-et-similarité-avec-sph--vic-et-mpm)
  - [1.2 Assimilation de données](#12-assimilation-de-données)
    - [1.2.1 Modèle stochastique du système](#121-modèle-stochastique-du-système)
    - [1.2.2 Probability formula](#122-probability-formula)
    - [1.2.3 Estimation](#123-estimation)
    - [1.2.4 Filtre Bayésien](#124-filtre-bayésien)
    - [1.2.5 Filtre particulaire](#125-filtre-particulaire)
    - [1.2.7 Formulation variationnelle](#127-formulation-variationnelle)
    - [1.2.6 Filtre de Kalman](#126-filtre-de-kalman)
    - [1.2.8 Filtre de Kalman d'Ensemble](#128-filtre-de-kalman-densemble)
    - [1.2.9 Méthodes Hybrides - RML](#129-méthodes-hybrides---rml)
- [2 Ensemble Data Assimilation pour la simulation particulaire - Article 1](#2-ensemble-data-assimilation-pour-la-simulation-particulaire---article-1)
  - [2.1 Filtre de Kalman d'Ensemble](#21-filtre-de-kalman-densemble)
  - [2.2 Focus approximation des méthodes particulaires](#22-focus-approximation-des-méthodes-particulaires)
  - [2.3 Schéma de remaillage](#23-schéma-de-remaillage)
  - [2.4 Focus problème VM](#24-focus-problème-vm)
  - [2.5 Filtres adaptés](#25-filtres-adaptés)
- [3 Data Assimilation: modification de la distribution particulaire](#3-data-assimilation-modification-de-la-distribution-particulaire)
- [4 Conclusion](#4-conclusion)

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