{
  ament_cmake,
  buildRosPackage,
  class_loader,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometric_shapes,
  interactive_markers,
  moveit_common,
  moveit_ros_planning_interface,
  moveit_ros_robot_interaction,
  moveit_ros_warehouse,
  object_recognition_msgs,
  pkg-config,
  pluginlib,
  qt5,
  rclcpp,
  rclpy,
  rviz2,
  substituteSource,
  tf2_eigen,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_visualization = substituteSource {
      src = fetchgit {
        name = "moveit_ros_visualization-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "2ff04821cc1ca95f85ab9e1149e77387453c11a6";
        hash = "sha256-T8ZN045rArWrW5ioSB6F5P+mx5YprOYmizGj9sKsUrM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_visualization";
  version = "2.10.0-1";
  src = sources.moveit_ros_visualization;
  nativeBuildInputs = [ ament_cmake pkg-config wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader eigen geometric_shapes interactive_markers moveit_common moveit_ros_planning_interface moveit_ros_robot_interaction moveit_ros_warehouse object_recognition_msgs pluginlib qt5.qtbase rclcpp rclpy rviz2 tf2_eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Components of MoveIt that offer visualization";
  };
}
