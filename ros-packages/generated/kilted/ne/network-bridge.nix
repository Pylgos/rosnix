{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "network_bridge";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."network_bridge";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ pluginlib rclcpp std-msgs tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-system-dev" "libzstd-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ pluginlib rclcpp std-msgs tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" "libzstd-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "network_bridge" = substituteSource {
      src = fetchgit {
        name = "network_bridge-source";
        url = "https://github.com/ros2-gbp/network_bridge-release.git";
        rev = "5d24e160c18af670502e49f7ce4413a85ccdbfb5";
        hash = "sha256-aroI5Ik5jvx4RQrUPxQF2MsAGqE8C6eP5GsA3NEFyJM=";
      };
    };
  });
  meta = {
    description = "Allows for arbitrary network links (UDP, TCP, etc) to bridge ROS2 messages";
  };
})
