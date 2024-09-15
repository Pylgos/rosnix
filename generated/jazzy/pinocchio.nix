{
  buildRosPackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  hpp-fcl,
  rosSystemPackages,
  substituteSource,
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ eigenpy hpp-fcl ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "liburdfdom-dev" "python3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
}
