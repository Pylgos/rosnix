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
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "eigen" "git" ]; };
  propagatedBuildInputs = [ eigenpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "boost" "liboctomap-dev" "python3" "python3-lxml" "python3-numpy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "hpp-fcl" = substituteSource {
      src = fetchgit {
        name = "hpp-fcl-source";
        url = "https://github.com/ros2-gbp/hpp_fcl-release.git";
        rev = "29a3e1b7e8b7af4c9aee3acaf0bfb42a7aaf329a";
        hash = "sha256-Cmb37aAo4tu2KLr30sOTgDPNr1Rti7UWPjoMkhRsMKc=";
      };
    };
  });
  meta = {
    description = "An extension of the Flexible Collision Library.";
  };
})
