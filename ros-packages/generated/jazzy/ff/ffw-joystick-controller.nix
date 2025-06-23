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
  version = "1.0.9-1";
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
        rev = "0e497a2e7ded5120a29d19dcc1eea35838778ca2";
        hash = "sha256-58thDVll12mgI1L1MDXxHgEATE55ivhN053V6jfWxeE=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 controller for reading joystick values\n  ";
  };
})
