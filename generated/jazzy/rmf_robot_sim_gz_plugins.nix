{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_gui_vendor,
  gz_msgs_vendor,
  gz_plugin_vendor,
  gz_rendering_vendor,
  gz_sim_vendor,
  gz_transport_vendor,
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
  sources = rec {
    rmf_robot_sim_gz_plugins = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_robot_sim_gz_plugins-source";
        owner = "ros2-gbp";
        repo = "rmf_simulation-release";
        rev = "49b2478e35f7ed08b8ba41285f6698c708b3f3b2";
        hash = "sha256-43Z/qobZT7vEhNNDK55q0pLbla9DCcNNEJYVq3d6Hm0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_robot_sim_gz_plugins";
  version = "2.3.2-1";
  src = sources.rmf_robot_sim_gz_plugins;
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
