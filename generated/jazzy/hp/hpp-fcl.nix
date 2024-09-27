{
  buildRosPackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    hpp-fcl-d9086e0b71e208d4630555b0d0e47cf07a8ddee5 = substituteSource {
      src = fetchgit {
        name = "hpp-fcl-d9086e0b71e208d4630555b0d0e47cf07a8ddee5-source";
        url = "https://github.com/ros2-gbp/hpp_fcl-release.git";
        rev = "d9086e0b71e208d4630555b0d0e47cf07a8ddee5";
        hash = "sha256-Cmb37aAo4tu2KLr30sOTgDPNr1Rti7UWPjoMkhRsMKc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hpp-fcl";
  version = "2.4.5-1";
  src = sources.hpp-fcl-d9086e0b71e208d4630555b0d0e47cf07a8ddee5;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ eigenpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "boost" "eigen" "liboctomap-dev" "python3" "python3-lxml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An extension of the Flexible Collision Library.";
  };
}
