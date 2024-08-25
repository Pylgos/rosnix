{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_xml,
  rmf_building_map_tools,
  rmf_demos_assets,
  rmf_demos_fleet_adapter,
  rmf_demos_maps,
  rmf_demos_tasks,
  rmf_fleet_adapter,
  rmf_task_ros2,
  rmf_traffic_ros2,
  rmf_visualization,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_demos = substituteSource {
      src = fetchgit {
        name = "rmf_demos-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "a4adcf382443e25aa205630ed14fb126e95c3b3a";
        hash = "sha256-Eqxl47veB826oMBkeGleZfr/J8uO5bBruT9ZftBpB1Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_demos";
  version = "2.4.0-1";
  src = sources.rmf_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_xml rmf_building_map_tools rmf_demos_assets rmf_demos_fleet_adapter rmf_demos_maps rmf_demos_tasks rmf_fleet_adapter rmf_task_ros2 rmf_traffic_ros2 rmf_visualization rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Common launch files for RMF demos";
  };
}
