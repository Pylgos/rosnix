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
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."network_bridge";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ pluginlib rclcpp std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-system-dev" "libzstd-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ pluginlib rclcpp std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" "libzstd-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "network_bridge" = substituteSource {
      src = fetchgit {
        name = "network_bridge-source";
        url = "https://github.com/ros2-gbp/network_bridge-release.git";
        rev = "fa0910b2fa58d9a930366e6a6b9c4d6842a5147c";
        hash = "sha256-rFjL5VY6uo+XC4OnNxiML8DRWGDhIjnCQyKk/O+bMyA=";
      };
    };
  });
  meta = {
    description = "Allows for arbitrary network links (UDP, TCP, etc) to bridge ROS2 messages";
  };
})
