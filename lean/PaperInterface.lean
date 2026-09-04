import QX26AgenticDelegation.Model

/-!
# Source-facing specifications

These transparent propositions are the compact review surface for the selected
threshold results. They intentionally expose every mathematical premise.
-/

namespace QX26AgenticDelegation

/-- Algebraic decomposition of the delegation-induced threshold reduction. -/
def thresholdGainIdentitySpec
    (baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance : ℝ) : Prop :=
  thresholdGain baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance =
    delegationShare * (agentValue - skill * mean)
      - verificationCost - delegationCost
      + risk / 2 *
        ((2 * delegationShare - delegationShare ^ 2) * skill ^ 2 / precision
          - delegationVariance)

/-- Adding delegation cannot raise the minimum threshold because it adds an option. -/
def menuExpansionSpec (preThreshold agentThreshold : ℝ) : Prop :=
  postThreshold preThreshold agentThreshold ≤ preThreshold

/-- A positive threshold gain is exactly a lower delegation threshold. -/
def positiveGainSpec
    (baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance : ℝ) : Prop :=
  0 < thresholdGain baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance ↔
    delegationThreshold baseCost skill mean delegationShare agentValue
        verificationCost delegationCost risk precision delegationVariance <
      soloThreshold baseCost skill mean risk precision

/-- When delegation lowers the threshold, it activates precisely the opportunity band
`agentThreshold ≤ opportunity < preThreshold`. -/
def activationBandSpec (opportunity preThreshold agentThreshold : ℝ) : Prop :=
  agentThreshold < preThreshold →
    (Active opportunity (postThreshold preThreshold agentThreshold) ∧
        ¬ Active opportunity preThreshold ↔
      agentThreshold ≤ opportunity ∧ opportunity < preThreshold)

/-- A monotone opportunity CDF implies weakly nonnegative expected expansion. -/
def expectedExpansionSpec
    (cdf : ℝ → ℝ) (preThreshold postThresholdValue : ℝ) : Prop :=
  Monotone cdf → postThresholdValue ≤ preThreshold →
    0 ≤ cdf preThreshold - cdf postThresholdValue

end QX26AgenticDelegation
