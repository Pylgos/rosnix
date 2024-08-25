{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  moveit_common,
  moveit_core,
  moveit_ros_planning,
  moveit_ros_visualization,
  pluginlib,
  rclcpp,
  rviz_common,
  rviz_rendering,
  srdfdom,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_framework = substituteSource {
      src = fetchgit {
        name = "moveit_setup_framework-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "376bde171f1210b2bdf29dbc2324eea288f02bbf";
        hash = "sha256-11UWNQcUX87xuOSYir0gcYs+rkUvPXMNp7PXBwErVCg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_framework";
  version = "2.10.0-1";
  src = sources.moveit_setup_framework;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp fmt moveit_common moveit_core moveit_ros_planning moveit_ros_visualization pluginlib rclcpp rviz_common rviz_rendering srdfdom urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "C++ Interface for defining setup steps for MoveIt Setup Assistant";
  };
}
