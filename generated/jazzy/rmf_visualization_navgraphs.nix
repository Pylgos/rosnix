{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
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
  rosSystemPackages,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    rmf_visualization_navgraphs = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_visualization_navgraphs-source";
        owner = "ros2-gbp";
        repo = "rmf_visualization-release";
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclcpp rclcpp_components rmf_building_map_msgs rmf_fleet_msgs rmf_traffic rmf_traffic_ros2 rmf_visualization_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package to visualiize the navigation graphs of fleets";
  };
}
