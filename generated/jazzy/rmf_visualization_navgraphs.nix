{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_components,
  rmf_building_map_msgs,
  rmf_fleet_msgs,
  rmf_traffic,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_visualization_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    rmf_visualization_navgraphs = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_navgraphs-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "5d7847890ceeea5f3168973690211db71127ef37";
        hash = "sha256-/MJqArAa3rNM1IItwqwfCYIiEZx1nsXBMQf9lMLLXb0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_navgraphs";
  version = "2.3.2-1";
  src = sources.rmf_visualization_navgraphs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp rclcpp_components rmf_building_map_msgs rmf_fleet_msgs rmf_traffic rmf_traffic_ros2 rmf_visualization_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common rmf_utils ];
  missingDependencies = [  ];
  meta = {
    description = "A package to visualiize the navigation graphs of fleets";
  };
}
