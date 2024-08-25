{
  assimp,
  buildRosPackage,
  cmake,
  doxygen,
  eigen,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  python3,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    hpp-fcl = substituteSource {
      src = fetchgit {
        name = "hpp-fcl-source";
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
  src = sources.hpp-fcl;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen git ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp eigen eigenpy python3 python3Packages.boost python3Packages.lxml python3Packages.numpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" ];
  meta = {
    description = "An extension of the Flexible Collision Library.";
  };
}
