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
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_spring_actuator_controller";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."ffw_spring_actuator_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle urdf ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_spring_actuator_controller" = substituteSource {
      src = fetchgit {
        name = "ffw_spring_actuator_controller-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "61694c0b7fd913c44a767a4e99d6e702be3b59c7";
        hash = "sha256-n+9fB9N0UgEvxwqYGDdOqNMRIbJ7AordUTCWwHsZ784=";
      };
    };
  });
  meta = {
    description = "\n    Spring Actuator Controller ROS 2 package.\n  ";
  };
})
