{
  ament_cmake,
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  backward_ros,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
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
  sources = rec {
    rmf_fleet_adapter = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_fleet_adapter-source";
        owner = "ros2-gbp";
        repo = "rmf_ros2-release";
        rev = "e954912b45d187dcfe3efa3cb0d4b7182d34996b";
        hash = "sha256-oQ0/oL7OkU5P/UTAStvoPh/dF525gW4Idrj15egR9rw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_fleet_adapter";
  version = "2.7.2-1";
  src = sources.rmf_fleet_adapter;
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
