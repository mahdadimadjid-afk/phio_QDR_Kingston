# Phio-QDR-Kingston: Empirical Phase-Locked Dynamic Decoupling on IBM Kingston QPU

This repository presents an empirical study on dynamic decoupling sequences, golden-ratio phase rotation, and gate-noise trade-offs evaluated on the 127-qubit superconducting processor **`ibm_kingston`**.

---

## Executive Summary & Vision

> **The Problem:** Current NISQ research often treats qubits within a rigid binary framework, attempting to mitigate decoherence by accumulating increasingly complex decoupling sequences. On physical hardware, this approach hits a wall: every added gate pulse injects cumulative physical calibration errors (*gate noise*)[span_0](start_span)[span_0](end_span)[span_1](start_span)[span_1](end_span).

> **Our Paradigm Shift:**
> 1. **Mathematical Unification:** Harmonize quantum control by combining complex phase geometry ($e^{i\phi}$ with the Golden Ratio $\phi \approx 1.61803398875$), Zeckendorf non-consecutive constraint rules, and Trachtenberg fast sequence timing.
> 2. **Circuit Sobriety over Over-Manipulation:** Demonstrate empirically to QPU developers (IBM, Google, academic labs) that **algebraic sobriety** and **unitary gate fusion ($U3$)** achieve higher target-state fidelity than heavy pulse sequences[span_2](start_span)[span_2](end_span)[span_3](start_span)[span_3](end_span)[span_4](start_span)[span_4](end_span).
> 3. **Bridge to Ternary Logic:** Lay the theoretical foundations for phase-resonance control that extends beyond binary qubits into ternary logic systems (qutrits) for higher information density and fault tolerance.

---

## Key Experimental Findings

Our multi-test benchmark across four OpenQASM 2.0 implementations on `ibm_kingston` highlights the physical trade-off between environmental phase stabilization and physical gate-error accumulation (*Pulse-Level Control Overhead*):

| Sequence / Strategy | Physical Gates | Target State `11` | Ground State `00` | Intermediate Error (`01` + `10`) | Hardware Verdict |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Bang-Bang ($X-X$)** | 4 $X$ gates | **~490 shots**[span_5](start_span)[span_5](end_span) | < 130 shots[span_6](start_span)[span_6](end_span) | **Minimal (< 260)**[span_7](start_span)[span_7](end_span) | **Optimal Ratio:** Minimal gate error, strong phase protection[span_8](start_span)[span_8](end_span). |
| **XY4 ($X-Y-X-Y$)** | 8 $X/Y$ gates | ~330 shots[span_9](start_span)[span_9](end_span) | ~198 shots[span_10](start_span)[span_10](end_span) | High (~475)[span_11](start_span)[span_11](end_span) | **Over-manipulation:** Accumulated pulse calibration errors[span_12](start_span)[span_12](end_span). |
| **CPMG ($Y-Y$)** | 4 $Y$ gates | ~335 shots[span_13](start_span)[span_13](end_span) | ~196 shots[span_14](start_span)[span_14](end_span) | High (~493)[span_15](start_span)[span_15](end_span) | $Y$-axis calibration bias on hardware[span_16](start_span)[span_16](end_span). |
| **Fusion $U3(\phi)$** | 4 $U3$ gates | **~360 shots**[span_17](start_span)[span_17](end_span) | **167 shots**[span_18](start_span)[span_18](end_span) | Moderate (~497)[span_19](start_span)[span_19](end_span) | **Noise Suppression:** Concentrates target state `11` and drops `00`[span_20](start_span)[span_20](end_span). |

---

## Theoretical Framework

### 1. Phase-Locking via Euler's Formula
We lock the qubit's resonance frame using the universal phase rotation angle $\phi \approx 1.61803398875$:
$$U_{phase} = e^{i\phi} = \cos(\phi) + i\sin(\phi)$$

### 2. Zeckendorf Constraint & Trachtenberg Arithmetic
- **Fibonacci Non-Consecutive Rule:** Applied to temporal pulse spacing to avoid pulse overlaps and destructive interference.
- **Trachtenberg Timing:** Low-overhead fast arithmetic used for calculating phase shifts without heavy floating-point operations.

### 3. OpenQASM Implementations & Datasets

All circuit source files and raw QPU dataset outputs are available in the `/results/` directory:

* `raw_uncalibrated_error.json`: Uncorrected baseline run on `ibm_kingston` highlighting raw phase decoherence and initial gate-drift errors. This error dataset served as the direct empirical trigger for investigating circuit-sobriety techniques.
* `bang_bang.qasm` / `bang_bang_result.json`: Short 4-gate sequence ($X-X$) demonstrating minimal pulse overhead and optimal target-state preservation[span_2](start_span)[span_2](end_span).
* `xy4.qasm` / `xy4_result.json`: 8-gate sequence ($X-Y-X-Y$) illustrating error accumulation due to multi-pulse calibration overhead on NISQ hardware[span_3](start_span)[span_3](end_span).
* `cpmg.qasm` / `cpmg_result.json`: 4-gate sequence ($Y-Y$) demonstrating hardware-specific $Y$-axis calibration bias.
* `fusion_u3.qasm` / `fusion_u3_result.json`: Parameterized single-unitary rotation ($U3$) locking the phase via the Golden Ratio ($\phi \approx 1.618$) to suppress ground-state noise.


---

## License
This project is licensed under the GNU General Public License v3.0 (GPLv3) - see the [LICENCE](LICENCE) file for details.

