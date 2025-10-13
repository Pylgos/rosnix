{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
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
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mecanum_drive_controller";
  version = "4.33.0-1";
  src = finalAttrs.passthru.sources."mecanum_drive_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools ros2-control-cmake std-srvs tf2 tf2-geometry-msgs tf2-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools ros2-control-cmake std-srvs tf2 tf2-geometry-msgs tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "mecanum_drive_controller" = substituteSource {
      src = fetchgit {
        name = "mecanum_drive_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "d99319899b135b8a925921d4c1bd71276241d7b2";
        hash = "sha256-a0X0SF3ZPXz90GLsxbUPb4uDSTaBjxQ0JPecjC2t/Tc=";
      };
    };
  });
  meta = {
    description = " Implementation of mecanum drive controller for 4 wheel drive.\n  ";
  };
})
