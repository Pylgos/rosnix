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
  version = "4.0.1-1";
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
        rev = "86e6fbb699b092786ca9a73b1c75187c532c6293";
        hash = "sha256-Gfp0EuwgC2GZ3LWGMbGI/lXG6vxExYgAkovzlDelnfg=";
      };
    };
  });
  meta = {
    description = "\n    Controller for compensating for gravity on a group of joints\n  ";
  };
})
