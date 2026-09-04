import QX26AgenticDelegation.MainTheorems

namespace QX26AgenticDelegation

theorem thresholdGainIdentitySpec_proved
    (baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance : ℝ) :
    thresholdGainIdentitySpec baseCost skill mean delegationShare agentValue
      verificationCost delegationCost risk precision delegationVariance :=
  thresholdGain_identity baseCost skill mean delegationShare agentValue
    verificationCost delegationCost risk precision delegationVariance

theorem menuExpansionSpec_proved
    (preThreshold agentThreshold : ℝ) :
    menuExpansionSpec preThreshold agentThreshold :=
  menu_expansion preThreshold agentThreshold

theorem positiveGainSpec_proved
    (baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance : ℝ) :
    positiveGainSpec baseCost skill mean delegationShare agentValue verificationCost
      delegationCost risk precision delegationVariance :=
  positive_gain_iff_lower_threshold baseCost skill mean delegationShare agentValue
    verificationCost delegationCost risk precision delegationVariance

theorem activationBandSpec_proved
    (opportunity preThreshold agentThreshold : ℝ) :
    activationBandSpec opportunity preThreshold agentThreshold :=
  activation_band opportunity preThreshold agentThreshold

theorem expectedExpansionSpec_proved
    (cdf : ℝ → ℝ) (preThreshold postThresholdValue : ℝ) :
    expectedExpansionSpec cdf preThreshold postThresholdValue :=
  expected_expansion_nonnegative cdf preThreshold postThresholdValue

end QX26AgenticDelegation
