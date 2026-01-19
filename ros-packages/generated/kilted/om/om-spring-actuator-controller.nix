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
  version = "4.1.2-1";
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
        rev = "ed6873e3168870cfbeca116cbc18b3fb8f820b74";
        hash = "sha256-/R+x6nW3FCG44tDugh49+wpHXEO8hiUu8CjZ2yOLeTU=";
      };
    };
  });
  meta = {
    description = "\n    Spring Actuator Controller ROS 2 package.\n  ";
  };
})
