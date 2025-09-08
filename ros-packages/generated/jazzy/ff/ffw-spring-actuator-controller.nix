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
  version = "1.1.11-1";
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
        rev = "96f68f75aa07b6fb7a566310c937a691750f92dd";
        hash = "sha256-Jv4Uvwx+YIZp7DgIcqMVPZhyr/weXAZretfzkfEA9sk=";
      };
    };
  });
  meta = {
    description = "\n    Spring Actuator Controller ROS 2 package.\n  ";
  };
})
