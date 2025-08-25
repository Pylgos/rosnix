{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_mppi_controller";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_mppi_controller";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ angles eigen3-cmake-module geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle std-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libomp-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ angles eigen3-cmake-module geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle std-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libomp-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_mppi_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_mppi_controller-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "cd9463639794f741aa39d50d0f10ce449ce2deb7";
        hash = "sha256-WpMS2Gsjojn3fixf//Bno9QV4HaQPfrn66sl0w+pxQk=";
      };
    };
  });
  meta = {
    description = "nav2_mppi_controller";
  };
})
