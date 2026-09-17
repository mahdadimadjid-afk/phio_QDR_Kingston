OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg c[2];

// 1. Initialisation
h q[0];

// 2. Phase du nombre d'or phi (1.618033 rad)
rz(1.61803398875) q[0];
cx q[0], q[1];

// 3. Stabilisation (Trachtenberg)
x q[1];
cp(0.80901699437) q[0], q[1];
x q[1];

// 4. Mesure des qubits
measure q[0] -> c[0];
measure q[1] -> c[1];
