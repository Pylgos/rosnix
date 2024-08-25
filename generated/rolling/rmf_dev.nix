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
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_dev = substituteSource {
      src = fetchgit {
        name = "rmf_dev-source";
        url = "https://github.com/ros2-gbp/rmf_variants-release.git";
        rev = "6df76b4024e822ab3669ae7f131f7828255e587a";
        hash = "sha256-1zapMn4jZKX6C1ftizIpnt9WJ+DERnvtTUHY3p4zBVY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_dev";
  version = "0.2.0-1";
  src = sources.rmf_dev;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_catch2 menge_vendor nlohmann_json_schema_validator_vendor pybind11_json_vendor rmf_api_msgs rmf_battery rmf_building_map_msgs rmf_building_map_tools rmf_building_sim_gz_plugins rmf_charger_msgs rmf_dispenser_msgs rmf_door_msgs rmf_fleet_adapter rmf_fleet_adapter_python rmf_fleet_msgs rmf_ingestor_msgs rmf_lift_msgs rmf_obstacle_msgs rmf_robot_sim_common rmf_robot_sim_gz_plugins rmf_scheduler_msgs rmf_site_map_msgs rmf_task rmf_task_msgs rmf_task_ros2 rmf_task_sequence rmf_traffic rmf_traffic_editor rmf_traffic_editor_assets rmf_traffic_editor_test_maps rmf_traffic_examples rmf_traffic_msgs rmf_traffic_ros2 rmf_utils rmf_visualization rmf_visualization_building_systems rmf_visualization_fleet_states rmf_visualization_floorplans rmf_visualization_msgs rmf_visualization_navgraphs rmf_visualization_obstacles rmf_visualization_rviz2_plugins rmf_visualization_schedule rmf_websocket rmf_workcell_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A package to aggregate the packages required for a minimal installation of Open-RMF";
  };
}
