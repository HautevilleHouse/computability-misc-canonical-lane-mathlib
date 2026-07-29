import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure ComputabilityBridgeData where
  turingComplete : Prop
  reductionConcept : Prop
  universalMachine : Prop
  haltingProblem : Prop

structure ComputabilityBridgeEvidence (B : ComputabilityBridgeData) where
  turingCompleteClosed : B.turingComplete
  reductionConceptClosed : B.reductionConcept
  universalMachineClosed : B.universalMachine
  haltingProblemClosed : B.haltingProblem

def ComputabilityBridgeClosed (B : ComputabilityBridgeData) : Prop :=
  B.turingComplete ∧ B.reductionConcept ∧
  B.universalMachine ∧ B.haltingProblem

theorem computability_bridge_closed_from_evidence (B : ComputabilityBridgeData) (E : ComputabilityBridgeEvidence B) :
    ComputabilityBridgeClosed B := by
  exact And.intro E.turingCompleteClosed
    (And.intro E.reductionConceptClosed
      (And.intro E.universalMachineClosed E.haltingProblemClosed))

end HautevilleHouse
end ComputabilityMiscCanonicalLaneLean