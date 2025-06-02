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
  rclcpp-components,
  rcpputils,
  ros-gz-interfaces,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_sim";
  version = "1.0.14-1";
  src = finalAttrs.passthru.sources."ros_gz_sim";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ ament-index-python builtin-interfaces geometry-msgs gz-math-vendor gz-msgs-vendor gz-sim-vendor gz-transport-vendor launch launch-ros rclcpp rclcpp-components rcpputils ros-gz-interfaces std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cli11" "libgflags-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ ament-index-python builtin-interfaces geometry-msgs gz-math-vendor gz-msgs-vendor gz-sim-vendor gz-transport-vendor launch launch-ros rclcpp rclcpp-components rcpputils ros-gz-interfaces std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cli11" "libgflags-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_sim" = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "2062f12690bfa87f9dd4ad54f2602711ef6adbc0";
        hash = "sha256-gwsTpHS617xldocX0/g9vXWYYgq4jPSGZ1JI+lnTXGE=";
      };
    };
  });
  meta = {
    description = "Tools for using Gazebo Sim simulation with ROS.";
  };
})
