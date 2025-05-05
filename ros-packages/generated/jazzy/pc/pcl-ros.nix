{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pcl_ros";
  version = "2.6.2-1";
  src = finalAttrs.passthru.sources."pcl_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libpcl-all-dev" "libpcl-common" "libpcl-features" "libpcl-filters" "libpcl-io" "libpcl-segmentation" "libpcl-surface" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" "libpcl-common" "libpcl-features" "libpcl-filters" "libpcl-io" "libpcl-segmentation" "libpcl-surface" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-ros launch-testing launch-testing-ros sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "pcl_ros" = substituteSource {
      src = fetchgit {
        name = "pcl_ros-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "9a55281930a3a501cb9fa7e7fd7f4244d71e7eb6";
        hash = "sha256-4CwCp92Ei2vmlkxdeJsjU+WFxcuP8xA7O4e3uFVLDgA=";
      };
    };
  });
  meta = {
    description = "\n\n  PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred\n  bridge for 3D applications involving n-D Point Clouds and 3D geometry\n  processing in ROS.\n\n  ";
  };
})
