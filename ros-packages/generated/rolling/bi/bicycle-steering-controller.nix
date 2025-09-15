{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  steering-controllers-library,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bicycle_steering_controller";
  version = "5.7.0-1";
  src = finalAttrs.passthru.sources."bicycle_steering_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake std-srvs steering-controllers-library ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle ros2-control-cmake std-srvs steering-controllers-library ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "bicycle_steering_controller" = substituteSource {
      src = fetchgit {
        name = "bicycle_steering_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "f84ed7f747d34695d0e8f634c49e1075b617ac2f";
        hash = "sha256-Vo9IFm2mPpI6hg0kabJTERBtC6PBv958DNzjQJYlLac=";
      };
    };
  });
  meta = {
    description = "Steering controller with bicycle kinematics. Rear fixed wheel is powering the vehicle and front wheel is steering.";
  };
})
