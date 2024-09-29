{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_gui_vendor,
  gz_msgs_vendor,
  gz_plugin_vendor,
  gz_rendering_vendor,
  gz_sim_vendor,
  gz_transport_vendor,
  mkSourceSet,
  rclcpp,
  rmf_building_map_msgs,
  rmf_building_sim_gz_plugins,
  rmf_fleet_msgs,
  rmf_robot_sim_common,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_robot_sim_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "11d58025c76c49d43b177e2530189772ed8da5ac";
        hash = "sha256-FNQ8DLnFyOb9wV24is8PWnzuYgM2D3RRBAMSB+zmgGM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_robot_sim_gz_plugins";
  version = "2.4.0-1";
  src = sources."rmf_robot_sim_gz_plugins";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_gui_vendor gz_msgs_vendor gz_plugin_vendor gz_rendering_vendor gz_sim_vendor gz_transport_vendor rclcpp rmf_building_map_msgs rmf_building_sim_gz_plugins rmf_fleet_msgs rmf_robot_sim_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS 2 Gazebo plugins for TeleportIngestors and TeleportDispensers";
  };
}