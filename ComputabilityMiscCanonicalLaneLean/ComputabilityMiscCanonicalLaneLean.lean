import HautevilleHouse.ComputabilityMiscCanonicalLaneLean.ChurchTuringThesis
import HautevilleHouse.ComputabilityMiscCanonicalLaneLean.NPCompleteness
import HautevilleHouse.ComputabilityMiscCanonicalLaneLean.HierarchyTheorems
import HautevilleHouse.ComputabilityMiscCanonicalLaneLean.AlgorithmicRandomness
import HautevilleHouse.ComputabilityMiscCanonicalLaneLean.ComputabilityBridgeLemmas

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

def ComputabilityMiscClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem computability_misc_endgame (A : AdmissibleClass) :
    ComputabilityMiscClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse
end ComputabilityMiscCanonicalLaneLean