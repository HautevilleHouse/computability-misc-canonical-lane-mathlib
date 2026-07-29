import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure TuringMachinePackage where
  states : Nat
  alphabet : Type u
  transitionFunction : states → alphabet → states × alphabet × Bool
  startState : states
  haltingStates : Set states
  initialState : alphabet → ℕ
  tapeBlankSymbol : alphabet

structure TuringMachineEvidence (T : TuringMachinePackage) where
  transitionDefined : ∀ s : T.states, ∀ a : T.alphabet, (T.transitionFunction s a).1 ∈ Finset.range T.states
  startStateIncluded : T.startState ∈ Finset.range T.states
  haltingSubset : T.haltingStates ⊆ Finset.range T.states
  haltingStatusProperty : ∀ s : T.states, s ∈ T.haltingStates ↔
    (∀ a : T.alphabet, (T.transitionFunction s a).1 = s)

def TuringMachineClosed (T : TuringMachinePackage) : Prop :=
  ∀ s : T.states, let (s', a, halt) := T.transitionFunction s (T.tapeBlankSymbol)
    in (s' = s) → halt = true

theorem turing_machine_closed_from_evidence (T : TuringMachinePackage)
    (E : TuringMachineEvidence T) : TuringMachineClosed T := by
  intro s
  have h := E.haltingStatusProperty s
  rcases h with ⟨hIn, hOut⟩
  apply hIn
  intro a
  exact (E.transitionDefined s a).1.2

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse