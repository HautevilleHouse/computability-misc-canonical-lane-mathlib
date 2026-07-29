import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure ComplexityClass where
  className : String
  timeBound : Nat -> Nat
  spaceBound : Nat -> Nat
  contains : Set (Nat -> Bool)

structure HierarchyEvidence (C1 C2 : ComplexityClass) where
  strictInclusion : C1.contains ⊂ C2.contains
  diagonalizationProof : Prop
  strictInclusionTerm : strictInclusion
  diagonalizationProofTerm : diagonalizationProof

def HierarchyClosed (C1 C2 : ComplexityClass) : Prop :=
  C1.contains ⊂ C2.contains

theorem hierarchy_closed_from_evidence (C1 C2 : ComplexityClass) (E : HierarchyEvidence C1 C2) : HierarchyClosed C1 C2 := by
  exact E.strictInclusionTerm

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse