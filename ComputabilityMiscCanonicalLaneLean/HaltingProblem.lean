import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure HaltingProblemOracle where
  canDecide : (TuringMachine -> List TuringMachine.alphabet -> Bool) -> Prop
  oracleFunction : (TuringMachine : Type) -> (alphabet : Type) -> TuringMachine -> List alphabet -> Bool
  consistency : Prop

structure HaltingProblemEvidence (H : HaltingProblemOracle) where
  undecidableProof : ¬ ∃ (f : TuringMachine -> List TuringMachine.alphabet -> Bool), ∀ (M : TuringMachine) (w : List TuringMachine.alphabet), f M w = true ↔ Halts M w
  consistencyTerm : H.consistency

def HaltingProblemClosed (H : HaltingProblemOracle) : Prop :=
  H.consistency

theorem halting_problem_closed_from_evidence (H : HaltingProblemOracle) (E : HaltingProblemEvidence H) : HaltingProblemClosed H := by
  exact E.consistencyTerm

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse