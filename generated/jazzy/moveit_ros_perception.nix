{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  freeglut,
  glew,
  image_transport,
  libGL,
  libGLU,
  llvmPackages,
  message_filters,
  moveit_common,
  moveit_core,
  moveit_msgs,
  moveit_ros_occupancy_map_monitor,
  moveit_ros_planning,
  object_recognition_msgs,
  pluginlib,
  rclcpp,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_perception = substituteSource {
      src = fetchgit {
        name = "moveit_ros_perception-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5a4fd053525dfaaa338cf73cb2d1956f089d83f4";
        hash = "sha256-NJpX8zqkfP2SGj0YS4mprp/gC9Zwy9jc+md61MDNsSg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_perception";
  version = "2.10.0-1";
  src = sources.moveit_ros_perception;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge eigen freeglut glew image_transport libGL libGLU llvmPackages.openmp message_filters moveit_common moveit_core moveit_msgs moveit_ros_occupancy_map_monitor moveit_ros_planning object_recognition_msgs pluginlib rclcpp sensor_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Components of MoveIt connecting to perception";
  };
}
