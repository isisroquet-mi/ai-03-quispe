import QX26AgenticDelegation.Model
import PaperInterface

namespace QX26AgenticDelegation

theorem thresholdGain_identity
    (baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance : ℝ) :
    thresholdGainIdentitySpec baseCost skill mean delegationShare agentValue
      verificationCost delegationCost risk precision delegationVariance := by
  unfold thresholdGainIdentitySpec thresholdGain soloThreshold delegationThreshold
  ring

theorem menu_expansion
    (preThreshold agentThreshold : ℝ) :
    menuExpansionSpec preThreshold agentThreshold := by
  exact min_le_left _ _

theorem positive_gain_iff_lower_threshold
    (baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance : ℝ) :
    positiveGainSpec baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance := by
  unfold positiveGainSpec thresholdGain
  constructor <;> intro h <;> linarith

theorem activation_band
    (opportunity preThreshold agentThreshold : ℝ) :
    activationBandSpec opportunity preThreshold agentThreshold := by
  intro hLower
  unfold Active postThreshold
  rw [min_eq_right (le_of_lt hLower)]
  simp only [not_le]

theorem expected_expansion_nonnegative
    (cdf : ℝ → ℝ) (preThreshold postThresholdValue : ℝ) :
    expectedExpansionSpec cdf preThreshold postThresholdValue := by
  intro hMonotone hThreshold
  have hCdf := hMonotone hThreshold
  linarith

end QX26AgenticDelegation
