{
  ament-cmake,
  buildAmentCmakePackage,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_joystick_controller";
  version = "1.1.16-1";
  src = finalAttrs.passthru.sources."ffw_joystick_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_joystick_controller" = substituteSource {
      src = fetchgit {
        name = "ffw_joystick_controller-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "16c934a5a9b31b0d0344736ffac62c53d37f456c";
        hash = "sha256-NxHTRvokE3Uy7iKkjZnDNP37AuD0HUm/rssH566Rkuk=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 controller for reading joystick values\n  ";
  };
})
