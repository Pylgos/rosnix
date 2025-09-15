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
  version = "4.0.8-1";
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
        rev = "f7ef90720df7d281cc61471925d1094a20bd2912";
        hash = "sha256-mCB0VozlxYwRV9+VZk0vqdhWHILbst+RM9i23ioGF4g=";
      };
    };
  });
  meta = {
    description = "\n    Controller for compensating for gravity on a group of joints\n  ";
  };
})
