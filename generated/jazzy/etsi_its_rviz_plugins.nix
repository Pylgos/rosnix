{
  ament_cmake,
  buildRosPackage,
  etsi_its_msgs,
  etsi_its_msgs_utils,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  qt5,
  rclcpp,
  ros_environment,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  rviz_rendering,
  rviz_satellite,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    etsi_its_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "etsi_its_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "7afb1932d1e8ffc0bf29661d281c544aaada73aa";
        hash = "sha256-1PsO7RaqrI25xAc4Z7eZ0HIG+lwxJEQIPpBvse0KCQ8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_rviz_plugins";
  version = "2.2.0-1";
  src = sources.etsi_its_rviz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_msgs etsi_its_msgs_utils pluginlib qt5.qtbase rclcpp rviz2 rviz_common rviz_default_plugins rviz_ogre_vendor rviz_rendering rviz_satellite tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "RViz plugin for ROS 2 messages based on ETSI ITS messages";
  };
}
