# Formalization plan

## Scope

Formalize the paper's central threshold chain without claiming an empirical causal result:

`threshold definitions → B = T^S - T^D → B > 0 iff T^D < T^S → activation band → nonnegative CDF difference`.

## Translation decisions

- Work over `ℝ`.
- Represent `a z(A)` as one real parameter, `agentValue`; the proof uses only its composite value.
- Represent `κ(a,s)` as `verificationCost` and `σ_D²(a,s,A)` as `delegationVariance`.
- Keep the economically substantive inequality `T^D < T^S` visible as a premise.
- Treat CDF monotonicity as an explicit premise; no distributional regularity is smuggled into the proof.

## Proof seams

1. Normalize the two threshold definitions with `ring`.
2. Use the order property of `min` for menu expansion.
3. Convert positive threshold difference to strict threshold ordering with linear arithmetic.
4. Rewrite the post threshold under `T^D < T^S` and expose the exact activation band.
5. Apply monotonicity of the CDF and linear arithmetic.

## Boundary

This pass does not formalize the difference-in-differences design, adoption timing, sample construction, or causal interpretation. The Lean result is conditional: if delegation lowers the model threshold, then and only then opportunities in the stated band become newly active.
