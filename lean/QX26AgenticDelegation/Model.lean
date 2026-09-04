import Mathlib

/-!
# Quispe-Xu threshold model

This file encodes the threshold comparison used in the paper's model of
solo production, conversational assistance, and agentic delegation.
-/

namespace QX26AgenticDelegation

noncomputable section

/-- Entry threshold under solo production. `precision` is the paper's π. -/
def soloThreshold
    (baseCost skill mean risk precision : ℝ) : ℝ :=
  baseCost - skill * mean + risk * skill ^ 2 / (2 * precision)

/-- Entry threshold under conversational assistance. -/
def conversationalThreshold
    (baseCost skill mean risk precision chatGain chatCost : ℝ) : ℝ :=
  soloThreshold baseCost skill mean risk precision - (chatGain * skill - chatCost)

/-- Entry threshold under agentic delegation.

`agentValue` abbreviates the paper's `a z(A)`, `verificationCost` is κ(a,s),
and `delegationVariance` is σ_D²(a,s,A).
-/
def delegationThreshold
    (baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance : ℝ) : ℝ :=
  baseCost - (1 - delegationShare) * skill * mean
    - delegationShare * agentValue
    + verificationCost + delegationCost
    + risk / 2 *
      ((1 - delegationShare) ^ 2 * skill ^ 2 / precision + delegationVariance)

/-- The effective threshold after adding delegation to the feasible menu. -/
def postThreshold (preThreshold agentThreshold : ℝ) : ℝ :=
  min preThreshold agentThreshold

/-- A language is active when its opportunity value clears the threshold. -/
def Active (opportunity threshold : ℝ) : Prop :=
  threshold ≤ opportunity

/-- The threshold reduction due to agentic delegation. -/
def thresholdGain
    (baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance : ℝ) : ℝ :=
  soloThreshold baseCost skill mean risk precision -
    delegationThreshold baseCost skill mean delegationShare agentValue
      verificationCost delegationCost risk precision delegationVariance

end

end QX26AgenticDelegation
