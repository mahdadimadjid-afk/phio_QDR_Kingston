OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg c[2];

// Initialisation
h q[0];
h q[1];

// Rotation de phase Phi
rz(1.61803398875) q[0];
rz(1.61803398875) q[1];
barrier q;

// Séquence CPMG (Impulsions Y déphasées)
y q[0];
y q[1];
barrier q;

y q[0];
y q[1];
barrier q;

// Mesure
measure q[0] -> c[0];
measure q[1] -> c[1];