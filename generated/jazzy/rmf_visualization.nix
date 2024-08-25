{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_xml,
  rmf_visualization_building_systems,
  rmf_visualization_fleet_states,
  rmf_visualization_floorplans,
  rmf_visualization_navgraphs,
  rmf_visualization_obstacles,
  rmf_visualization_rviz2_plugins,
  rmf_visualization_schedule,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_visualization = substituteSource {
      src = fetchgit {
        name = "rmf_visualization-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "7425f0eec9cfae30f755539a7e3ff8c4e99c6736";
        hash = "sha256-Yf6tYLAXIEZoxfZmTA0Wxl67vp5SeI90iIog9NWMJvw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization";
  version = "2.3.2-1";
  src = sources.rmf_visualization;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_xml rmf_visualization_building_systems rmf_visualization_fleet_states rmf_visualization_floorplans rmf_visualization_navgraphs rmf_visualization_obstacles rmf_visualization_rviz2_plugins rmf_visualization_schedule ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing a single launch file to bringup various visualizations";
  };
}
