on rappelle la formule de mise à jour enkf 

$$
u^a_i(x) = u^f_i + \sum_{j=1}^N F_{ij} u^f_j(x)
$$

En développant, on obtient une discrétization particulaire. On souhaite la projeter sur le précédente discrétization.

On obtient alors
$$
\begin{align*}
\Gamma^a_{i,p} &= \langle u^a_i, \phi_{i,p} \rangle \\
\end{align*} 
$$

Cette expression peut être simplifié en développant $u^a$ et en utilisant la propriété du noyau gaussien

$$
\langle \phi(\cdot;x_p), \phi(\cdot;x_q) \rangle = \sqrt \pi h~\phi_{\sqrt 2h}(x_p - x_q) 
$$

Ainsi

$$
\begin{align*}
\Gamma^a_{i,p} &= \langle u^a_i, \phi_{i,p} \rangle \\
&= \left\langle u^f_i + \sum_{j=1}^N F_{ij} u^f_j, \phi_{i,p} \right\rangle \\
&= \langle u^f_i,  \phi_{i,p} \rangle + \sum_{j=1}^N F_{ij} \langle u^f_j, \phi_{i,p} \rangle \\
&= \sum_{q=1}^{N_q} (1 + F_{ii})\Gamma^f_{i,q} \langle \phi_{i,q}, \phi_{i, p} \rangle + \sum_{q \neq i} \sum_{r=1}^{N_r} F_{ij} \Gamma^f_{j, r} \langle \phi_{i,q}, \phi_{i, p} \rangle \\
&= \sqrt \pi h \sum_{q=1}^{N_q} (1 + F_{ii})\Gamma^f_{i,q} \phi(x_{i,p} - x_{i, q}; \sqrt 2 h)+ \sum_{q \neq i} \sum_{r=1}^{N_r} F_{ij} \Gamma^f_{j, r} \phi(x_{i,p} - x_{j, r}; \sqrt 2 h)
\end{align*}
$$