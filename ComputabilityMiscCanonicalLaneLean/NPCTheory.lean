import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure NPCompletePackage where
  decisionProblem : Type u
  certificate : Type v
  polynomialTimeVerifier : certificate → decisionProblem → Prop
  reductionToSAT : decisionProblem → Prop
  completenessProof : Prop

structure NPCompleteEvidence (N : NPCompletePackage) where
  verifierPolynomial : N.polynomialTimeVerrier ∈ PolynomialTime
  reductionToSATClosed : N.reductionToSAT
  completenessProofClosed : N.completenessProof

def NPCompleteClosed (N : NPCompletePackage) : Prop :=
  N.reductionToSAT ∧ N.completenessProof

theorem np_complete_closed_from_evidence (N : NPCompletePackage) (E : NPCompleteEvidence N) : NPCompleteClosed N := by
  exact And.intro E.reductionToSATClosed E.completenessProofClosed

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse