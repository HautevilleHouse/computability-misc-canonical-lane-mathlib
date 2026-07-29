import ComputabilityMiscCanonicalLaneLean.FinalTheorem
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputabilityMiscCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ComputabilityAdmittedObject where
  object : Type
  claimed : Prop
  conclusion : claimed

def ComputabilityWitnessClosed (O : ComputabilityAdmittedObject) : Prop :=
  O.claimed

structure ComputabilityMiscTheoremStatement where
  description : String
  admittedObject : ComputabilityAdmittedObject
  endgameClosed : Prop
  endgameProof : endgameClosed

def computabilityMiscTheoremStatement : ComputabilityMiscTheoremStatement :=
  let obj : ComputabilityAdmittedObject := {
    object := String,
    claimed := True,
    conclusion := True.intro
  }
  {
    description := "Computability Misc",
    admittedObject := obj,
    endgameClosed := forall A : AdmissibleClass, ConstrainedComputabilityMiscClosure A,
    endgameProof := by
      intro A
      exact constrained_computability_misc_endgame A
  }

end ComputabilityMiscCanonicalLaneLean
end HautevilleHouse