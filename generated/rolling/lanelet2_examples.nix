{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  lanelet2_io,
  lanelet2_matching,
  lanelet2_projection,
  lanelet2_python,
  lanelet2_routing,
  lanelet2_traffic_rules,
  mrt_cmake_modules,
  ros2cli,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_examples = substituteSource {
      src = fetchgit {
        name = "lanelet2_examples-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "3046775d4ef1580e110ffe268ac51e8ccf6b358b";
        hash = "sha256-jbMdHabSoOnjj7zKI54sz2P3Nrq8NRpYCHYb7pekzX0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_examples";
  version = "1.2.1-6";
  src = sources.lanelet2_examples;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_io lanelet2_matching lanelet2_projection lanelet2_python lanelet2_routing lanelet2_traffic_rules ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Examples for working with Lanelet2";
  };
}
