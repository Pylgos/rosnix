{
  ament-cmake,
  ament-cmake-gtest,
  buildRosPackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-msgs,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-moveit-config,
  moveit-ros-move-group,
  moveit-ros-planning,
  moveit-ros-warehouse,
  moveit-simple-controller-manager,
  rclcpp,
  rclcpp-action,
  rclpy,
  ros-testing,
  rosSystemPackages,
  rviz2,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_ros_planning_interface" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_planning_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0a7fd6fe8eb7a4312263d29d37a837ea467416b2";
        hash = "sha256-82oyVxPYQ2OOWfizXutEnEqsYTVteQkhodVk++G325Y=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_ros_planning_interface";
  version = "2.11.0-1";
  src = sources."moveit_ros_planning_interface";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs moveit-common moveit-core moveit-msgs moveit-ros-move-group moveit-ros-planning moveit-ros-warehouse rclcpp rclcpp-action rclpy tf2 tf2-eigen tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest moveit-configs-utils moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config moveit-simple-controller-manager ros-testing rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Components of MoveIt that offer simpler remote (as from another ROS 2 node) interfaces to planning and execution";
  };
}
