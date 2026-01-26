{
  ament-cmake,
  ament-cmake-python,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
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
  rclcpp-action,
  rclcpp-components,
  rcpputils,
  ros-gz-bridge,
  ros-gz-interfaces,
  ros2pkg,
  rosSystemPackages,
  simulation-interfaces,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_sim";
  version = "2.1.13-1";
  src = finalAttrs.passthru.sources."ros_gz_sim";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ ament-index-python builtin-interfaces geometry-msgs gz-math-vendor gz-msgs-vendor gz-sim-vendor gz-transport-vendor launch launch-ros rclcpp rclcpp-action rclcpp-components rcpputils ros2pkg ros-gz-interfaces simulation-interfaces std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cli11" "libgflags-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ ament-index-python builtin-interfaces geometry-msgs gz-math-vendor gz-msgs-vendor gz-sim-vendor gz-transport-vendor launch launch-ros rclcpp rclcpp-action rclcpp-components rcpputils ros2pkg ros-gz-interfaces simulation-interfaces std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cli11" "libgflags-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ros-gz-bridge ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_sim" = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "bb05a0c68f13d243edc0c00aa85fcc465bb5681a";
        hash = "sha256-mm1BmD1geRdrBaCBa/areoVZploeEn7Y3ok7M9YiHSg=";
      };
    };
  });
  meta = {
    description = "Tools for using Gazebo Sim simulation with ROS.";
  };
})
