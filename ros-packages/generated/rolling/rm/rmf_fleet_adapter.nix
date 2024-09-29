{
  ament_cmake,
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  backward_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nlohmann_json_schema_validator_vendor,
  rclcpp,
  rclcpp_components,
  rmf_api_msgs,
  rmf_battery,
  rmf_building_map_msgs,
  rmf_dispenser_msgs,
  rmf_door_msgs,
  rmf_fleet_msgs,
  rmf_ingestor_msgs,
  rmf_lift_msgs,
  rmf_task,
  rmf_task_msgs,
  rmf_task_ros2,
  rmf_task_sequence,
  rmf_traffic,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_websocket,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_fleet_adapter" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "e3b4acb0f79fda7404ef833b474c5ef5a1d4678b";
        hash = "sha256-4OpVpYiwtkJ0bMwvmGwKhJM8K7CSrD5uPCpyHJnPRF4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_fleet_adapter";
  version = "2.7.1-1";
  src = sources."rmf_fleet_adapter";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros nlohmann_json_schema_validator_vendor rclcpp rclcpp_components rmf_api_msgs rmf_battery rmf_building_map_msgs rmf_dispenser_msgs rmf_door_msgs rmf_fleet_msgs rmf_ingestor_msgs rmf_lift_msgs rmf_task rmf_task_msgs rmf_task_ros2 rmf_task_sequence rmf_traffic rmf_traffic_ros2 rmf_utils rmf_websocket std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_catch2 ament_cmake_uncrustify ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Fleet Adapter package for RMF fleets.";
  };
}