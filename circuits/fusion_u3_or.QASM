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

// Porte universelle fusionnée U3(theta, phi, lambda)
// Rotation combinée verrouillant la résonance sur le Nombre d'Or
u3(3.14159265359, 1.61803398875, 0) q[0];
u3(3.14159265359, 1.61803398875, 0) q[1];
barrier q;

// Deuxième impulsion d'équilibrage de phase
u3(3.14159265359, -1.61803398875, 0) q[0];
u3(3.14159265359, -1.61803398875, 0) q[1];
barrier q;

// Mesure finale
measure q[0] -> c[0];
measure q[1] -> c[1];