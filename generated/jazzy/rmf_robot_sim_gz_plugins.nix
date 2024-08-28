{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_gui_vendor,
  gz_msgs_vendor,
  gz_plugin_vendor,
  gz_rendering_vendor,
  gz_sim_vendor,
  gz_transport_vendor,
  qt5,
  rclcpp,
  rmf_building_map_msgs,
  rmf_building_sim_gz_plugins,
  rmf_fleet_msgs,
  rmf_robot_sim_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_robot_sim_gz_plugins = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen gz_gui_vendor gz_msgs_vendor gz_plugin_vendor gz_rendering_vendor gz_sim_vendor gz_transport_vendor qt5.qtbase qt5.qtdeclarative rclcpp rmf_building_map_msgs rmf_building_sim_gz_plugins rmf_fleet_msgs rmf_robot_sim_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS 2 Gazebo plugins for TeleportIngestors and TeleportDispensers";
  };
}
