import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

structure AdmissibleClass where
  object : ComputabilityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ComputabilityWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse