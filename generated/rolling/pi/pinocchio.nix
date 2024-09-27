{
  buildRosPackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  hpp-fcl,
  rosSystemPackages,
  ros_environment,
  substituteSource,
  urdfdom,
}:
let
  sources = rec {
    pinocchio-03fb86713a9374d25e2a82dd64ac2f7524a52511 = substituteSource {
      src = fetchgit {
        name = "pinocchio-03fb86713a9374d25e2a82dd64ac2f7524a52511-source";
        url = "https://github.com/ros2-gbp/pinocchio-release.git";
        rev = "03fb86713a9374d25e2a82dd64ac2f7524a52511";
        hash = "sha256-KL3fG4wA2xF6e386oy8YpjAOZqwusyFnqG696AMIWWM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pinocchio";
  version = "3.2.0-1";
  src = sources.pinocchio-03fb86713a9374d25e2a82dd64ac2f7524a52511;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" "cmake" ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ eigenpy hpp-fcl urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "python3" "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A fast and flexible implementation of Rigid Body Dynamics algorithms and their analytical derivatives.";
  };
}
