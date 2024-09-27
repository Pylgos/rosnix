{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_utils,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic-115cb3d6e520330da26430f58a4d87bba028ec61 = substituteSource {
      src = fetchgit {
        name = "rmf_traffic-115cb3d6e520330da26430f58a4d87bba028ec61-source";
        url = "https://github.com/ros2-gbp/rmf_traffic-release.git";
        rev = "115cb3d6e520330da26430f58a4d87bba028ec61";
        hash = "sha256-GsvWlGm9wOqDfFFLBx/5bA0m7HX+RXAciWvTU8pvg4Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic";
  version = "3.4.0-1";
  src = sources.rmf_traffic-115cb3d6e520330da26430f58a4d87bba028ec61;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libccd-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package for managing traffic in the Robotics Middleware Framework";
  };
}
