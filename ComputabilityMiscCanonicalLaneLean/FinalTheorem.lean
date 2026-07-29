import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComputabilityMiscCanonicalLaneLean.ChurchTuringThesis
import HautevilleHouse.ComputabilityMiscCanonicalLaneLean.NPCompleteness
import HautevilleHouse.ComputabilityMiscCanonicalLaneLean.HierarchyTheorems
import HautevilleHouse.ComputabilityMiscCanonicalLaneLean.AlgorithmicRandomness
import HautevilleHouse.ComputabilityMiscCanonicalLaneLean.Undecidability

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

def ConstrainedComputabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_computability_endgame (A : AdmissibleClass) :
    ConstrainedComputabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse