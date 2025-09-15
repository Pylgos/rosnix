{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  laser-geometry,
  launch,
  launch-ros,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-sensor-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pointcloud_to_laserscan";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."pointcloud_to_laserscan";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ laser-geometry launch launch-ros message-filters rclcpp rclcpp-components sensor-msgs tf2 tf2-ros tf2-sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ laser-geometry launch launch-ros message-filters rclcpp rclcpp-components sensor-msgs tf2 tf2-ros tf2-sensor-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "pointcloud_to_laserscan" = substituteSource {
      src = fetchgit {
        name = "pointcloud_to_laserscan-source";
        url = "https://github.com/ros2-gbp/pointcloud_to_laserscan-release.git";
        rev = "155a9f9e9055585dfb27e93c6a893568b25e2eb9";
        hash = "sha256-DB6YQqvoC2cvU+tjWc8llr6Im4YV6o/pTZi6E3Ql5vU=";
      };
    };
  });
  meta = {
    description = "Converts a 3D Point Cloud into a 2D laser scan. This is useful for making devices like the Kinect appear like a laser scanner for 2D-based algorithms (e.g. laser-based SLAM).";
  };
})
