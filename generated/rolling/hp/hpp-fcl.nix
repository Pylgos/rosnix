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
    hpp-fcl-29a3e1b7e8b7af4c9aee3acaf0bfb42a7aaf329a = substituteSource {
      src = fetchgit {
        name = "hpp-fcl-29a3e1b7e8b7af4c9aee3acaf0bfb42a7aaf329a-source";
        url = "https://github.com/ros2-gbp/hpp_fcl-release.git";
        rev = "29a3e1b7e8b7af4c9aee3acaf0bfb42a7aaf329a";
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
  src = sources.hpp-fcl-29a3e1b7e8b7af4c9aee3acaf0bfb42a7aaf329a;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ eigenpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "boost" "eigen" "liboctomap-dev" "python3" "python3-lxml" "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An extension of the Flexible Collision Library.";
  };
}
