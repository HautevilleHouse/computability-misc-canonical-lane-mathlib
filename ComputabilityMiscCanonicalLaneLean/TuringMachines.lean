import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure TuringMachine where
  states : Type
  alphabet : Type
  transition : states -> alphabet -> states × alphabet × Bool
  startState : states
  haltingStates : Set states

structure TuringMachineEvidence (M : TuringMachine) where
  deterministic : Prop
  haltsOnInput : List M.alphabet -> Prop
  deterministicTerm : deterministic
  haltsOnInputTerm : haltsOnInput []

def TuringMachineClosed (M : TuringMachine) : Prop :=
  M.states ≠ Empty ∧ M.alphabet ≠ Empty

theorem turing_machine_closed_from_evidence (M : TuringMachine) (E : TuringMachineEvidence M) : TuringMachineClosed M := by
  exact And.intro (by
    have : Nonempty M.states := by
      apply Nonempty.intro M.startState
    exact this.ne_empty)
    (by
      have : Nonempty M.alphabet := by
        refine Nonempty.intro ?_
        sorry
      exact this.ne_empty)

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse