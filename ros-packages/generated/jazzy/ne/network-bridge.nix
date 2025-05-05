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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "network_bridge";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."network_bridge";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ pluginlib std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" "libzstd-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "network_bridge" = substituteSource {
      src = fetchgit {
        name = "network_bridge-source";
        url = "https://github.com/ros2-gbp/network_bridge-release.git";
        rev = "c625bfef13c67072a1a39f37fc3859d5f3cfb27b";
        hash = "sha256-Gfm+jv0L73LlZMytVTDOCyqyBGqctp6URffWJU/opmk=";
      };
    };
  });
  meta = {
    description = "Allows for arbitrary network links (UDP, TCP, etc) to bridge ROS2 messages";
  };
})
