import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure ChurchTuringThesisPackage where
  partialRecursiveFunctions : Type u
  turingMachines : Type v
  lambdaCalculus : Type w
  equivalenceEstablished : Prop
  equivalenceEstablishedTerm : equivalenceEstablished

structure ChurchTuringThesisEvidence (C : ChurchTuringThesisPackage) where
  equivalenceEstablishedClosed : C.equivalenceEstablished

def ChurchTuringThesisClosed (C : ChurchTuringThesisPackage) : Prop :=
  C.equivalenceEstablished

theorem church_turing_thesis_closed_from_evidence (C : ChurchTuringThesisPackage)
    (E : ChurchTuringThesisEvidence C) : ChurchTuringThesisClosed C :=
  E.equivalenceEstablishedClosed

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse