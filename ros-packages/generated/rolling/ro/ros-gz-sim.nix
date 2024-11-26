{
  ament-cmake,
  ament-cmake-python,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-sim-vendor,
  gz-transport-vendor,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_sim";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."ros_gz_sim";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ ament-index-python gz-math-vendor gz-msgs-vendor gz-sim-vendor gz-transport-vendor launch launch-ros rclcpp rclcpp-components std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgflags-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ros_gz_sim" = substituteSource {
        src = fetchgit {
          name = "ros_gz_sim-source";
          url = "https://github.com/ros2-gbp/ros_ign-release.git";
          rev = "4e8849a6b000fb2531e62f28fedd2ae5055c596b";
          hash = "sha256-sSTH79LS4YiLOMOkVD6z3SDxsH6qyGVISQ3OXxGqCoQ=";
        };
      };
    });
  };
  meta = {
    description = "Tools for using Gazebo Sim simulation with ROS.";
  };
})
