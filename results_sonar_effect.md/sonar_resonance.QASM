OPENQASM 3.0;
include "stdgates.inc";

// Allocation : Q0 = Qubit principal, Q1 = Qubit tampon
qubit[2] q;
bit[2] c;

// 1. Préparation de l'état sur Q0 (Porte U3 ajustée)
u3(1.6180339887, 0, 0) q[0];

// 2. Couplage avec le tampon Q1 (Résonance)
cx q[0], q[1];

// 3. Découplage temporel non périodique (Intervalle basé sur \phi)
delay[144dt] q[0];
x q[0];
delay[233dt] q[0];
x q[0];

// 4. Intrication inverse et mesure
cx q[0], q[1];
c[0] = measure q[0];
c[1] = measure q[1];