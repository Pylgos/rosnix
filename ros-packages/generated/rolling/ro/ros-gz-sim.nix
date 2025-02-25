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
  rcpputils,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_sim";
  version = "2.1.5-1";
  src = finalAttrs.passthru.sources."ros_gz_sim";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ ament-index-python gz-math-vendor gz-msgs-vendor gz-sim-vendor gz-transport-vendor launch launch-ros rclcpp rclcpp-components rcpputils std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgflags-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_sim" = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "b9012ef019df3037b162b87b84a3c439f348b838";
        hash = "sha256-iEEOEAJtCgQ8JHdyHIUk9ukxhHYbzeYdrl9i8Gx1Rgk=";
      };
    };
  });
  meta = {
    description = "Tools for using Gazebo Sim simulation with ROS.";
  };
})
