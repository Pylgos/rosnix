{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  message_filters,
  mkSourceSet,
  moveit_common,
  moveit_core,
  moveit_msgs,
  moveit_ros_occupancy_map_monitor,
  moveit_ros_planning,
  object_recognition_msgs,
  pluginlib,
  rclcpp,
  rosSystemPackages,
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
  sources = mkSourceSet (sources: {
    "moveit_ros_perception" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_perception-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "043463672defc12b592a9268dafa4d39be534d5f";
        hash = "sha256-rFSC9YlLgiexWdX1cjk8llWmlEL1xjfBAlCcCd2EWR0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_ros_perception";
  version = "2.11.0-1";
  src = sources."moveit_ros_perception";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge image_transport message_filters moveit_common moveit_core moveit_msgs moveit_ros_occupancy_map_monitor moveit_ros_planning object_recognition_msgs pluginlib rclcpp sensor_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "glut" "libglew-dev" "libomp-dev" "opengl" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Components of MoveIt connecting to perception";
  };
}
