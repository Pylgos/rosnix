{
  ament-cmake-gmock,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  control-msgs,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcpputils,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_swerve_drive_controller";
  version = "1.1.7-1";
  src = finalAttrs.passthru.sources."ffw_swerve_drive_controller";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-msgs visualization-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_swerve_drive_controller" = substituteSource {
      src = fetchgit {
        name = "ffw_swerve_drive_controller-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "7618ef9aa27393ef438fc6c4a5ba29241f4a6670";
        hash = "sha256-POKAJcyfEF5y7Jjwt0Xog7gO/MgUfjg996+S/3XQlI4=";
      };
    };
  });
  meta = {
    description = "AI Worker's swerve drive ros2_controller";
  };
})
