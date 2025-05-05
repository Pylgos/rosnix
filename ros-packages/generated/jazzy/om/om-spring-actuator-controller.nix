{
  ament-cmake,
  angles,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  control-toolbox,
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
  realtime-tools,
  rosSystemPackages,
  rsl,
  substituteSource,
  tl-expected,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "om_spring_actuator_controller";
  version = "3.2.2-1";
  src = finalAttrs.passthru.sources."om_spring_actuator_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ generate-parameter-library rclcpp rclcpp-lifecycle rsl tl-expected ];
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface hardware-interface pluginlib realtime-tools urdf ];
  passthru.sources = mkSourceSet (sources: {
    "om_spring_actuator_controller" = substituteSource {
      src = fetchgit {
        name = "om_spring_actuator_controller-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "030740593fa7ef149241d021deb711f90ca075ca";
        hash = "sha256-hZ+ck+as0X/Ij5a1dEkhFFfUpRUuOeyCYzu0SOVmck8=";
      };
    };
  });
  meta = {
    description = "Spring Actuator Controller ROS 2 package.";
  };
})
