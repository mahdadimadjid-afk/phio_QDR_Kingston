OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg c[3];

// ÉTAPE 1 : Initialisation & Superposition (Anyon sur q[0])
ry(1.230959417) q[0];
rz(1.047197551) q[0];

// ÉTAPE 2 : Couplage Anyon <-> Magnon (q[0] <-> q[1])
rz(0.785398163) q[0];
cz q[0], q[1];
rx(1.570796327) q[1];
cz q[0], q[1];

// ÉTAPE 3 : Action du Phonon (Séquence Sonar sur q[2])
id q[2]; // Remplacement du delay par une porte identité/pause
rz(1.570796327) q[2];
x q[2];
id q[2];
x q[2];
rz(1.570796327) q[2];

// Intrication du puit de relaxation
cz q[1], q[2];
ry(-0.785398163) q[1];

// ÉTAPE 4 : Mesures
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
