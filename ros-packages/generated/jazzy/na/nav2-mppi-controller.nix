{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_mppi_controller";
  version = "1.3.9-1";
  src = finalAttrs.passthru.sources."nav2_mppi_controller";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" "libomp-dev" "xsimd" "xtensor" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "libomp-dev" "xsimd" "xtensor" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_mppi_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_mppi_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "3f1ff0301fbbb5a18175428e836fa62f88870070";
        hash = "sha256-DQo4hN1UvMnpncPNnQ2segkBGbyscWP2kQKt7Y66USQ=";
      };
    };
  });
  meta = {
    description = "nav2_mppi_controller";
  };
})
