{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  lanelet2_io,
  lanelet2_maps,
  lanelet2_projection,
  lanelet2_traffic_rules,
  mrt_cmake_modules,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_matching = substituteSource {
      src = fetchgit {
        name = "lanelet2_matching-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "1f596aee68f20a115a33c6d5d64dbd681c814121";
        hash = "sha256-umrqsdgMBtb04ryHzY6h/Yb+wrZUXVnyvb+0AeF2ebI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_matching";
  version = "1.2.1-6";
  src = sources.lanelet2_matching;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_traffic_rules ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest lanelet2_io lanelet2_maps lanelet2_projection ];
  missingDependencies = [  ];
  meta = {
    description = "Library to match objects to lanelets";
  };
}
