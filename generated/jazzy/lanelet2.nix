{
  ament_cmake_core,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2_core,
  lanelet2_examples,
  lanelet2_io,
  lanelet2_maps,
  lanelet2_matching,
  lanelet2_projection,
  lanelet2_python,
  lanelet2_routing,
  lanelet2_traffic_rules,
  lanelet2_validation,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    lanelet2 = substituteSource {
      src = fetchFromGitHub {
        name = "lanelet2-source";
        owner = "ros2-gbp";
        repo = "lanelet2-release";
        rev = "35568a79dd5ce9e1e1d0aa22e4e06903d4a23915";
        hash = "sha256-AzSwj7wfb5mwc935jTjea1QB6+8BRLtOJyhJlWiBoLM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2";
  version = "1.2.1-1";
  src = sources.lanelet2;
  nativeBuildInputs = [ ament_cmake_core ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lanelet2_core lanelet2_examples lanelet2_io lanelet2_maps lanelet2_matching lanelet2_projection lanelet2_python lanelet2_routing lanelet2_traffic_rules lanelet2_validation ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Meta-package for lanelet2";
  };
}
