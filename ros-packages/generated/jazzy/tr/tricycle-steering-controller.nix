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
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  steering-controllers-library,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tricycle_steering_controller";
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."tricycle_steering_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle std-srvs steering-controllers-library ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "tricycle_steering_controller" = substituteSource {
      src = fetchgit {
        name = "tricycle_steering_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "5ef2b493963d4733f01fec10e9aa07999fc5eac4";
        hash = "sha256-tn5tBTdDp6E47vtey2tbgrRz0d5X6MyDTZesIOVLgQY=";
      };
    };
  });
  meta = {
    description = "Steering controller with tricycle kinematics. Rear fixed wheels are powering the vehicle and front wheel is steering.";
  };
})
