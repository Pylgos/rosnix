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
  pname = "om_spring_actuator_controller";
  version = "4.0.7-1";
  src = finalAttrs.passthru.sources."om_spring_actuator_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle urdf ];
  passthru.sources = mkSourceSet (sources: {
    "om_spring_actuator_controller" = substituteSource {
      src = fetchgit {
        name = "om_spring_actuator_controller-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "052330a8a7de46d2d1b3ae2f240e75ed9e243b82";
        hash = "sha256-3/QDNimsPgfZG1T+PKwPdEc8SRcUDN3MrrWmuMP26x8=";
      };
    };
  });
  meta = {
    description = "\n    Spring Actuator Controller ROS 2 package.\n  ";
  };
})
