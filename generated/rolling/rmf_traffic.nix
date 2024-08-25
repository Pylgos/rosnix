{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  libccd,
  rmf_utils,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic = substituteSource {
      src = fetchgit {
        name = "rmf_traffic-source";
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
  src = sources.rmf_traffic;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libccd rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ];
  missingDependencies = [  ];
  meta = {
    description = "Package for managing traffic in the Robotics Middleware Framework";
  };
}
