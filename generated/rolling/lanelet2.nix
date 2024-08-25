{
  ament_cmake_core,
  buildRosPackage,
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
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    lanelet2 = substituteSource {
      src = fetchgit {
        name = "lanelet2-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "77dec70b3711c67d92c6473f2b33cf635e64d996";
        hash = "sha256-AzSwj7wfb5mwc935jTjea1QB6+8BRLtOJyhJlWiBoLM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2";
  version = "1.2.1-6";
  src = sources.lanelet2;
  nativeBuildInputs = [ ament_cmake_core ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_examples lanelet2_io lanelet2_maps lanelet2_matching lanelet2_projection lanelet2_python lanelet2_routing lanelet2_traffic_rules lanelet2_validation ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Meta-package for lanelet2";
  };
}
