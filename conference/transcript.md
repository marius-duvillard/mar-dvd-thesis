# Transcript

- My presentation concerns our work with OLM and Loïc Giraldi on the development of ensemble DA for MS.
- Firs tI will introduce what is a MS and one type of DA method ; then two ways to adapt it for MS. Then, I will illustrate it on a problem exemple.
- When I talk about MS, I refere to a class of mthod that do not rely on a fix Eulerian mesh. The solution rely on another type of discretization in order to tackle situation where using a mesh is challenging, As well as in fluid or solid mechanics or both.
- The simulation of rotationg drum illustrate a case where a MS is used cause due to free-surface flow,large deformation, mixing and interaction of different materials.
- What exactly is a MS. Like for mesh simulaiton you want to discretize a continous field u thanks to a family of functions that you sum up. Here it is a family of kernel function centered around a position x_p and with a strength gamma_p forming what we called particles.
- But what is specific to the method is that those quantities will evolved through time thanks to a model evolution.
- I will illustrate my presentation with the an example in fluid dynamic the vortex method to solve the incompresible Euler equation.
- The VM discretize the vorticity field by affecting a local circulation to each particles. Each particle induced a vortex around his position proportional to the strenght. The Gamma is concerved but the position evolved with a non linear ODE by evaluating the veloctiy induced by all the particles. I have discretize 3 vortex with several particles, those particles induced a vel field in wich those positions evolved.
- On the other hand all sim are subject to uncertainties that lead to prediction errors.
- The goal of DA will by to integrate observations in order to have a better estimation and reduce uncertainties and apply it sequentially.
- One exemple of sequential DA algo is the EnKF filter. It is an extension of the KF well adapted to non linear and high dimentional simulation. In consists to sample an initial distribution of state and to propagate them through time thanks to a code in order to have statistic at time t_k. Then based on observation and members predictions, weights are apply to each members to update the states. 
- If initial and forecast ok , the analysis is more sensitive for meshless sim
- Indeed you can easily seen that the combination, then the use of member field discretization lead to a MS with all the particles.