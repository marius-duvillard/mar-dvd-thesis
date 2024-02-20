# Ensemble-based Kalman Filter 

## Introduction

Numerical modeling is developing in many field of engineering and science. Thanks to the increasing of the computational ressources, they are a tool to understand and design process, particularly in the case of mechanical simulation.
However, the result of the solution involve errors which have to be understand, quantify and tried to be reduce. The aim is to have a prediction that match the actual system behavior. Numerical simulation is first, due to a imperfect knowledge of the real correponding behavior, subject to model error. The numerical model usually bring essential physical principal and involved simplification to ensure. From a well posed mathematical problem, numerical errors appear. In this case uncertainty appear due to algorithm and discretization used to solve the set of mathematical equations. Finally, error occur due to aleatory in data and parameters define to the particular simulation. It is basicly linked to the geometry, the definition of boundary and initial conditions or external forces.
- expose the problem
- Insist on the importance of the problem
- Expose the resolution method
- Expose the state of the art
- Problematic
- Lay out 



## Background

### Data assimilation

- Reprendre version état discrétisé

### Particles methods
- Présenter hypothèse des méthodes particulaires

### resampling operators
- présenter les méthodes de remaillage
An ensemble of remeshing technic have been long time used to avoid distorsion in the distribution of particles [ref de Moreau et al. + Vortex method]

## Methods

Based on the formulation of the ensemble Kalman Filter, and the use of specific particle operator, we propose different type of adaptation of the traditional Stochastic Kalman Filter. First, the Part-Grid-EnKF is based on a complete regular particles resampling method to get a commun state vector representation. Following, we propose the Part-Part-EnKF which update the solution directly on each particle discretations.

### Filters
#### Part-Grid-EnKF
For this type of filter...
- Réécrire problème d'assimilation de données avec les champs ou avec les grandeurs particulaire : définition de l'état différent.
- Utilisation de l'opérateur de remaillage.


### Error criteria

## Applications

### One dimensional advection case

### Vortex Methods for Inviscid Incompressible Flows

#### Présentation des équations
- Formuler l'équation d'Euler en termes de vorticité et de fonction courant

    For a in
    $$
    \begin{aligned}
    \frac{\partial \omega}{\partial t} + (u\frac{\partial \omega}{\partial x} + v\frac{\partial \omega}{\partial y}) &= 0 \\
    \frac{\partial \psi}{\partial y}u - \frac{\partial \psi}{\partial x}v &= \omega \
    \end{aligned}
    $$

    Où $\omega$ est la vorticité, $\psi$ est la fonction courant, $u$ est la vitesse horizontale et $v$ est la vitesse verticale.

    An equivalent Lagrangian formulation could be obtained 
    
    $$ \begin{aligned}\frac{D\omega}{Dt} = 0 \\
    \frac{D\psi}{Dt} = \omega
    \end{aligned}
    $$

where $\frac{D}{Dt}$ represents the material derivative, which is defined as:

$\frac{D}{Dt} = \frac{\partial}{\partial t} + u\frac{\partial}{\partial x} + v\frac{\partial}{\partial y}$.

In this formulation, vorticity is considered a conserved quantity that moves with the fluid, while the stream function describes the fluid motion. The first equation indicates that vorticity is transported with the fluid without being created or destroyed. The second equation indicates that the stream function is equal to the circulation of the velocity around a material contour, and thus also follows the fluid motion.

- Discrétiser les équations en utilisant une méthode numérique appropriée.

- Appliquer des conditions aux limites appropriées pour refléter les parois périodiques.

- Résolvez les équations discrétisées pour obtenir la solution de la vorticité et de la fonction courant à chaque instant.
 
- Utilisez la solution de la vorticité pour calculer la vitesse en chaque point de l'espace en utilisant la relation $ u = \frac{\partial \psi}{\partial y}$ et $v = -\frac{\partial \psi}{\partial x}$

#### PIC scheme
In order to accelerate the computation, the resolution is based on the Vortex-In-Cell algorithm and a fft solver.
The step are first to assign particle vorticity values to the grid using a particle to grid formula.
Then compute the velocity field solving the Poisson equation on the grid. Then the velocity is interpolate back on the particles using grid to particles formula. Then a Lagrangian advection is perform 



