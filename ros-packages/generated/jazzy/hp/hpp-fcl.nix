{
  buildCmakePackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "hpp-fcl";
  version = "2.4.5-1";
  src = finalAttrs.passthru.sources."hpp-fcl";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" "python3-numpy" ]; };
  propagatedBuildInputs = [ eigenpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "boost" "eigen" "liboctomap-dev" "python3" "python3-lxml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "hpp-fcl" = substituteSource {
      src = fetchgit {
        name = "hpp-fcl-source";
        url = "https://github.com/ros2-gbp/hpp_fcl-release.git";
        rev = "d9086e0b71e208d4630555b0d0e47cf07a8ddee5";
        hash = "sha256-Cmb37aAo4tu2KLr30sOTgDPNr1Rti7UWPjoMkhRsMKc=";
      };
    };
  });
  meta = {
    description = "An extension of the Flexible Collision Library.";
  };
})
