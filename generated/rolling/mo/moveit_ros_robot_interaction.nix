{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive_markers,
  moveit_common,
  moveit_core,
  moveit_ros_planning,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_robot_interaction-b7d6e24b54bf0db2518f722e7b3f5da9e2476666 = substituteSource {
      src = fetchgit {
        name = "moveit_ros_robot_interaction-b7d6e24b54bf0db2518f722e7b3f5da9e2476666-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b7d6e24b54bf0db2518f722e7b3f5da9e2476666";
        hash = "sha256-zP6fvBdcieyJFKTx2LDhu7XI+8ThhY7C0i3IQbXt0Z4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_robot_interaction";
  version = "2.11.0-1";
  src = sources.moveit_ros_robot_interaction-b7d6e24b54bf0db2518f722e7b3f5da9e2476666;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ interactive_markers moveit_common moveit_core moveit_ros_planning rclcpp tf2 tf2_eigen tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Components of MoveIt that offer interaction via interactive markers";
  };
}
