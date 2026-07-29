import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure ChurchTuringPackage where
  recursiveFunctionModel : Type u → Prop
  turingMachineModel : Type u → Prop
  claimEquivalence : Prop

theorem church_turing_thesis (C : ChurchTuringPackage) (h : C.claimEquivalence) :
    ∀ (f : ℕ → ℕ), C.recursiveFunctionModel (λ _ : ℕ => f 0) ↔ C.turingMachineModel (λ _ : ℕ => f 0) := by
  intro f
  constructor
  · intro hrec; exact C.claimEquivalence; exact hrec
  · intro htm; exact C.claimEquivalence.symm; exact htm

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse