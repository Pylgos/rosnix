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
  version = "1.1.5-1";
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
        rev = "e28123077226af0f975a203b49b261ade64e2eea";
        hash = "sha256-Bsh9qm3wMK1d5wZVK8jn3xbc2nfW+AwArfmoFqgVji4=";
      };
    };
  });
  meta = {
    description = "\n    Spring Actuator Controller ROS 2 package.\n  ";
  };
})
