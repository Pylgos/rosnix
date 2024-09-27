{
  ament_cmake,
  ament_cmake_catch2,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  menge_vendor,
  nlohmann_json_schema_validator_vendor,
  pybind11_json_vendor,
  rmf_api_msgs,
  rmf_battery,
  rmf_building_map_msgs,
  rmf_building_map_tools,
  rmf_building_sim_gz_plugins,
  rmf_charger_msgs,
  rmf_dispenser_msgs,
  rmf_door_msgs,
  rmf_fleet_adapter,
  rmf_fleet_adapter_python,
  rmf_fleet_msgs,
  rmf_ingestor_msgs,
  rmf_lift_msgs,
  rmf_obstacle_msgs,
  rmf_robot_sim_common,
  rmf_robot_sim_gz_plugins,
  rmf_scheduler_msgs,
  rmf_site_map_msgs,
  rmf_task,
  rmf_task_msgs,
  rmf_task_ros2,
  rmf_task_sequence,
  rmf_traffic,
  rmf_traffic_editor,
  rmf_traffic_editor_assets,
  rmf_traffic_editor_test_maps,
  rmf_traffic_examples,
  rmf_traffic_msgs,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_visualization,
  rmf_visualization_building_systems,
  rmf_visualization_fleet_states,
  rmf_visualization_floorplans,
  rmf_visualization_msgs,
  rmf_visualization_navgraphs,
  rmf_visualization_obstacles,
  rmf_visualization_rviz2_plugins,
  rmf_visualization_schedule,
  rmf_websocket,
  rmf_workcell_msgs,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_dev-844b092fe10885f11327c84f9f7c1fd7ffdcee12 = substituteSource {
      src = fetchgit {
        name = "rmf_dev-844b092fe10885f11327c84f9f7c1fd7ffdcee12-source";
        url = "https://github.com/ros2-gbp/rmf_variants-release.git";
        rev = "844b092fe10885f11327c84f9f7c1fd7ffdcee12";
        hash = "sha256-XThgYJiLzrj6OBp7jqdHvFPpT5xTuTKIEv2Yz2DoDIU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_dev";
  version = "0.1.0-1";
  src = sources.rmf_dev-844b092fe10885f11327c84f9f7c1fd7ffdcee12;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_catch2 menge_vendor nlohmann_json_schema_validator_vendor pybind11_json_vendor rmf_api_msgs rmf_battery rmf_building_map_msgs rmf_building_map_tools rmf_building_sim_gz_plugins rmf_charger_msgs rmf_dispenser_msgs rmf_door_msgs rmf_fleet_adapter rmf_fleet_adapter_python rmf_fleet_msgs rmf_ingestor_msgs rmf_lift_msgs rmf_obstacle_msgs rmf_robot_sim_common rmf_robot_sim_gz_plugins rmf_scheduler_msgs rmf_site_map_msgs rmf_task rmf_task_msgs rmf_task_ros2 rmf_task_sequence rmf_traffic rmf_traffic_editor rmf_traffic_editor_assets rmf_traffic_editor_test_maps rmf_traffic_examples rmf_traffic_msgs rmf_traffic_ros2 rmf_utils rmf_visualization rmf_visualization_building_systems rmf_visualization_fleet_states rmf_visualization_floorplans rmf_visualization_msgs rmf_visualization_navgraphs rmf_visualization_obstacles rmf_visualization_rviz2_plugins rmf_visualization_schedule rmf_websocket rmf_workcell_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package to aggregate the packages required for a minimal installation of Open-RMF";
  };
}
