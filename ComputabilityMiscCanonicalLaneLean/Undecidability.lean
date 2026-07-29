import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure TuringMachine (stateAlphabet inputAlphabet : Type) where
  states : Type
  transitions : Type
  haltingState : states
  startState : states
  blankSymbol : inputAlphabet

structure DecisionProblem where
  encoding : Type
  question : String
  yesInstances : Set encoding
  noInstances : Set encoding

structure Reduction (A B : DecisionProblem) where
  computableMap : A.encoding → B.encoding
  correctnessProof : Prop

def haltingProblem : DecisionProblem := {
  encoding := ℕ
  question := "Does Turing machine M halt on input w?"
  yesInstances := Set.univ
  noInstances := Set.univ
}

structure UndecidabilityPackage where
  haltingUndecidable : ¬ (Reduction haltingProblem haltingProblem).correctnessProof
  otherUndecidableProblems : List DecisionProblem
  reductionsShowUndecidability : Prop
  ricesTheorem : Prop

structure UndecidabilityEvidence (U : UndecidabilityPackage) where
  haltingClosed : U.haltingUndecidable
  reductionsClosed : U.reductionsShowUndecidability
  ricesClosed : U.ricesTheorem

def UndecidabilityClosed (U : UndecidabilityPackage) : Prop :=
  U.haltingUndecidable ∧ U.reductionsShowUndecidability ∧ U.ricesTheorem

theorem undecidability_closed_from_evidence
    (U : UndecidabilityPackage) (E : UndecidabilityEvidence U) :
    UndecidabilityClosed U := by
  exact And.intro E.haltingClosed
    (And.intro E.reductionsClosed E.ricesClosed)

def gateClosed (A : AdmissibleClass) : Prop :=
  UndecidabilityClosed (A.object : UndecidabilityPackage)

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse