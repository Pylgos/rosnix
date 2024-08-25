{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dummy_map_server,
  dummy_sensors,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  robot_state_publisher,
  substituteSource,
}:
let
  sources = rec {
    dummy_robot_bringup = substituteSource {
      src = fetchgit {
        name = "dummy_robot_bringup-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "c8e83973d30a27ee3ffc9fbce7d4b91ec346459b";
        hash = "sha256-SPZM3ZERTqe7Yr82lZTi9cID5qKsNtPP4o88bcEtvoA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_robot_bringup";
  version = "0.33.4-1";
  src = sources.dummy_robot_bringup;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python dummy_map_server dummy_sensors launch launch_ros robot_state_publisher ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "dummy robot bringup";
  };
}
