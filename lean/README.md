# Lean formalization: Quispe and Xu (2026)

This folder is the output of an independent EconCSLib-style formalization pass for the threshold mechanism in the paper. It is intentionally partial and auditable rather than presented as a full-paper proof.

## What is checked

1. The algebraic decomposition of the threshold gain `B = T^S - T^D`.
2. Adding delegation to the menu weakly lowers the effective threshold: `min T^1 T^D ≤ T^1`.
3. `B > 0` is equivalent to `T^D < T^S`.
4. If `T^D < T^S`, the newly activated opportunities are exactly `T^D ≤ ω < T^S`.
5. For a monotone CDF, lowering the threshold makes `F(T^1) - F(T^2)` nonnegative.

The most presentation-ready result is `activation_band` in `QX26AgenticDelegation/MainTheorems.lean`: it connects the paper's threshold inequality to the exact band of newly viable language opportunities.

## Files

- `PaperInterface.lean`: transparent source-facing propositions.
- `ProofInterface.lean`: exact-type proof endpoints.
- `QX26AgenticDelegation/Model.lean`: model definitions.
- `QX26AgenticDelegation/MainTheorems.lean`: proofs.
- `Assumptions.lean`: explicit interpretation boundary.
- `SOURCE.md`: source and scope record.
- `status.json`: machine-readable status.
- `docs/FORMALIZATION_PLAN.md`: execution plan and decisions.
- `audit/`: source map, proof-fidelity notes, and validation transcript.

## Validation

The core files target Lean `v4.30.0-rc2` with Mathlib. The audit transcript records the exact verification surface and any environment limitations. No `sorry`, `admit`, or added axiom is used in the selected proofs.
