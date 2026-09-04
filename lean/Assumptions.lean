import Mathlib

/-!
# Assumption ledger

The proved Lean statements use ordered real arithmetic and the explicitly visible
premises in `PaperInterface.lean`. The economically substantive condition that
delegation lowers the entry threshold is not assumed silently: it appears as the
antecedent `agentThreshold < preThreshold` in `activationBandSpec`.

The paper's domain restrictions (`precision > 0`, `risk ≥ 0`,
`0 ≤ delegationShare ≤ 1`, and nonnegative delegation variance) are relevant to
economic interpretation, but the selected algebraic and order-theoretic claims do
not need them as proof hypotheses.
-/
