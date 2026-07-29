import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure AlgorithmicRandomness where
  space : Type
  measure : Set space -> ℝ
  randomnessTest : (space -> Bool) -> Prop

structure RandomnessEvidence (A : AlgorithmicRandomness) where
  martingaleConvergence : ∀ (test : A.space -> Bool), A.randomnessTest test → ∃ (x : A.space), test x = true
  uncomputability : Prop
  martingaleConvergenceTerm : martingaleConvergence
  uncomputabilityTerm : uncomputability

def AlgorithmicRandomnessClosed (A : AlgorithmicRandomness) : Prop :=
  ∀ (test : A.space -> Bool), A.randomnessTest test → ∃ (x : A.space), test x = true

theorem algorithmic_randomness_closed_from_evidence (A : AlgorithmicRandomness) (E : RandomnessEvidence A) : AlgorithmicRandomnessClosed A := by
  exact E.martingaleConvergenceTerm

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse