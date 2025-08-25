{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-common,
  nav2-controller,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-regulated-pure-pursuit-controller,
  nav2-util,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_rotation_shim_controller";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_rotation_shim_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles geometry-msgs nav2-common nav2-controller nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rcl-interfaces rclcpp rclcpp-lifecycle tf2 tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs nav2-common nav2-controller nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rcl-interfaces rclcpp rclcpp-lifecycle tf2 tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common nav2-controller nav2-regulated-pure-pursuit-controller ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_rotation_shim_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_rotation_shim_controller-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "307c592be2c8c1de1e4b303f9c3352d83e22b4c4";
        hash = "sha256-FnjIBmdPu6PCu1oR3V4ZaRZOFKfxLSfvUqRHRnOPxjk=";
      };
    };
  });
  meta = {
    description = "Rotation Shim Controller";
  };
})
