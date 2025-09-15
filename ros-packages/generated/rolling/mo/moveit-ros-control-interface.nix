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
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."moveit_ros_control_interface";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager-msgs moveit-common moveit-core moveit-simple-controller-manager pluginlib rclcpp-action trajectory-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager-msgs moveit-common moveit-core moveit-simple-controller-manager pluginlib rclcpp-action trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_control_interface" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_control_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0e3339b203f96c994b3a68edbf3545e16993cf01";
        hash = "sha256-SRQXM7Qqbem4ncfblyaFolhN+JutAn28DgAhFvg4NZo=";
      };
    };
  });
  meta = {
    description = "ros_control controller manager interface for MoveIt";
  };
})
