import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

-- The bridge is defined as the closure of the admitted object

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ComputabilityWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse