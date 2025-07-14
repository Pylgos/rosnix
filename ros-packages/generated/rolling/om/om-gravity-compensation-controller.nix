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
  kdl-parser,
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
  pname = "om_gravity_compensation_controller";
  version = "4.0.5-1";
  src = finalAttrs.passthru.sources."om_gravity_compensation_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface kdl-parser pluginlib rclcpp rclcpp-lifecycle realtime-tools rsl tl-expected urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface kdl-parser pluginlib rclcpp rclcpp-lifecycle realtime-tools rsl tl-expected urdf ];
  passthru.sources = mkSourceSet (sources: {
    "om_gravity_compensation_controller" = substituteSource {
      src = fetchgit {
        name = "om_gravity_compensation_controller-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "8185fe4df156bc99b7d5f71615f03361f248ce8f";
        hash = "sha256-GZYjWRTA7RZMqk/ubqCinLhabqL1Voj/wJUji2rgfGU=";
      };
    };
  });
  meta = {
    description = "\n    Controller for compensating for gravity on a group of joints\n  ";
  };
})
