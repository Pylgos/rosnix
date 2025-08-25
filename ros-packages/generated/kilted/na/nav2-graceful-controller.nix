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
  nav-2d-utils,
  nav-msgs,
  nav2-common,
  nav2-controller,
  nav2-core,
  nav2-costmap-2d,
  nav2-util,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_graceful_controller";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_graceful_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-2d-utils nav-msgs pluginlib rcl-interfaces rclcpp rclcpp-lifecycle tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-2d-utils nav-msgs pluginlib rcl-interfaces rclcpp rclcpp-lifecycle tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common nav2-controller ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_graceful_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_graceful_controller-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "f1a7e5aef7c0a1ec86595fbd1090526b88e137a7";
        hash = "sha256-DeWYwl06nUv9Svo3mU9SoDfSaL9xQdkm/tG79SL03Tg=";
      };
    };
  });
  meta = {
    description = "Graceful motion controller";
  };
})
