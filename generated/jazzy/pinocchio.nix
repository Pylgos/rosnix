{
  buildPackages,
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
        rev = "4ece81b852e001508a82e42194a34de911b1db5b";
        hash = "sha256-YFDwdoORgCb/x5PR//6nJtG6NghoeKsE60VEwuNP/ik=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pinocchio";
  version = "2.6.21-3";
  src = sources.pinocchio;
  nativeBuildInputs = [ clang cmake ];
  propagatedNativeBuildInputs = [ doxygen git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen eigenpy hpp-fcl python3 python3Packages.boost urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
}
