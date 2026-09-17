OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg c[2];

// Initialisation en superposition
h q[0];
h q[1];

// Application de la rotation de phase basée sur Phi
rz(1.61803398875) q[0];
rz(1.61803398875) q[1];
barrier q;

// Séquence de découplage dynamique XY4
x q[0];
x q[1];
barrier q;

y q[0];
y q[1];
barrier q;

x q[0];
x q[1];
barrier q;

y q[0];
y q[1];
barrier q;

// Mesure finale
measure q[0] -> c[0];
measure q[1] -> c[1];