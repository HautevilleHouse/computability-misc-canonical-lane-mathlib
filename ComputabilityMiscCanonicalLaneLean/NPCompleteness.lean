import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure NPCompletenessPackage where
  satReduction : Prop
  cliqueReduction : Prop
  vertexCoverReduction : Prop
  reductionsEstablished : Prop
  reductionsEstablishedTerm : reductionsEstablished

structure NPCompletenessEvidence (N : NPCompletenessPackage) where
  reductionsEstablishedClosed : N.reductionsEstablished

def NPCompletenessClosed (N : NPCompletenessPackage) : Prop :=
  N.reductionsEstablished

theorem np_completeness_closed_from_evidence (N : NPCompletenessPackage)
    (E : NPCompletenessEvidence N) : NPCompletenessClosed N :=
  E.reductionsEstablishedClosed

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse