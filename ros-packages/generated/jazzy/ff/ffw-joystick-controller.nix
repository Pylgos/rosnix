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
  version = "1.1.5-1";
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
        rev = "4000252d1b378eef96e6086d04d3384f9464e706";
        hash = "sha256-4T1vbaq0Hv164O4qgrB6QuCQoS0A4/HM+NsrLpYgfA8=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 controller for reading joystick values\n  ";
  };
})
