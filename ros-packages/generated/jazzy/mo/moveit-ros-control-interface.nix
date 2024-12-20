{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-simple-controller-manager,
  pluginlib,
  rclcpp-action,
  rosSystemPackages,
  substituteSource,
  trajectory-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_control_interface";
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_ros_control_interface";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ controller-manager-msgs moveit-common moveit-core moveit-simple-controller-manager pluginlib rclcpp-action trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_control_interface" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_control_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "6b05cbba407d17c7327e2fdab7b30bebf65d93d9";
        hash = "sha256-9fgPyYwd3Ily5x9Pg688UFKiSie5EbcvT02lTfaDz58=";
      };
    };
  });
  meta = {
    description = "ros_control controller manager interface for MoveIt";
  };
})
