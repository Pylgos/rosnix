{
  ament-cmake,
  ament-cmake-ros,
  beluga,
  beluga-ros,
  bondcpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "beluga_amcl";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."beluga_amcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ beluga beluga-ros bondcpp message-filters rclcpp rclcpp-components rclcpp-lifecycle std-srvs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ beluga beluga-ros bondcpp message-filters rclcpp rclcpp-components rclcpp-lifecycle std-srvs tf2-ros ];
  checkInputs = [ ament-cmake-ros ];
  passthru.sources = mkSourceSet (sources: {
    "beluga_amcl" = substituteSource {
      src = fetchgit {
        name = "beluga_amcl-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "9587b1f1b58cb89ac98716ec3cd42ba0b96cdce5";
        hash = "sha256-xHpEpVM9yTksXCYCkzHb7A5hoLrLCuN0NTMHuCgfZyU=";
      };
    };
  });
  meta = {
    description = "An AMCL node implementation for ROS2 using Beluga.";
  };
})
