{
  buildRosPackage,
  clang,
  cmake,
  doxygen,
  eigen,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  hpp-fcl,
  python3,
  python3Packages,
  substituteSource,
  urdfdom,
}:
let
  sources = rec {
    pinocchio = substituteSource {
      src = fetchgit {
        name = "pinocchio-source";
        url = "https://github.com/ros2-gbp/pinocchio-release.git";
        rev = "597860b805cbece2461b5e75d1b572decd999c86";
        hash = "sha256-YFDwdoORgCb/x5PR//6nJtG6NghoeKsE60VEwuNP/ik=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pinocchio";
  version = "2.6.21-2";
  src = sources.pinocchio;
  nativeBuildInputs = [ clang cmake ];
  propagatedNativeBuildInputs = [ doxygen git ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen eigenpy hpp-fcl python3 python3Packages.boost python3Packages.numpy urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
}
