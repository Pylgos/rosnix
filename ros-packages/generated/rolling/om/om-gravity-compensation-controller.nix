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
  version = "3.3.0-1";
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
        rev = "8f3dbd9bc6915fa373600330f1063c8824f19c9a";
        hash = "sha256-XIcMgbaiyxD9yifzlvHcSsW97q5qadbOB9QsMyYS+98=";
      };
    };
  });
  meta = {
    description = "\n    Controller for compensating for gravity on a group of joints\n  ";
  };
})
