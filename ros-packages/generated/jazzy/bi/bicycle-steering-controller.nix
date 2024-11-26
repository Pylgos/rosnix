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
  pname = "bicycle_steering_controller";
  version = "4.16.0-1";
  src = finalAttrs.passthru.sources."bicycle_steering_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle std-srvs steering-controllers-library ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "bicycle_steering_controller" = substituteSource {
      src = fetchgit {
        name = "bicycle_steering_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "bce7243605573d6429c634c5a195a3b4025ec2d9";
        hash = "sha256-S3Lt1DxHPoeDC8yjcoufYWi1vrWJYW7gE9Uoc0QxA/s=";
      };
    };
  });
  meta = {
    description = "Steering controller with bicycle kinematics. Rear fixed wheel is powering the vehicle and front wheel is steering.";
  };
})
