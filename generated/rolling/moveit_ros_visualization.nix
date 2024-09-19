{
  ament_cmake,
  buildRosPackage,
  class_loader,
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
  pluginlib,
  rclcpp,
  rclpy,
  rosSystemPackages,
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
        rev = "b3f3f4b5ba64292b084050f3443c2b8334255362";
        hash = "sha256-u3nihc4cjT2x+dlWJyOAye45WLW+Obh6ljN3rRw029Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_visualization";
  version = "2.11.0-1";
  src = sources.moveit_ros_visualization;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ class_loader geometric_shapes interactive_markers moveit_common moveit_ros_planning_interface moveit_ros_robot_interaction moveit_ros_warehouse object_recognition_msgs pluginlib rclcpp rclpy rviz2 tf2_eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-opengl-dev" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Components of MoveIt that offer visualization";
  };
}
