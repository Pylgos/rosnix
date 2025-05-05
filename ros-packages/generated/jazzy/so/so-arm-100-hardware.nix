{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "so_arm_100_hardware";
  version = "0.1.0-3";
  src = finalAttrs.passthru.sources."so_arm_100_hardware";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ hardware-interface pluginlib std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "so_arm_100_hardware" = substituteSource {
      src = fetchgit {
        name = "so_arm_100_hardware-source";
        url = "https://github.com/brukg/so_arm_100_hardware-release.git";
        rev = "b8706845ef8aef9e46e5604153a1d0fe2577c368";
        hash = "sha256-2bR9OEW1Ol2WHkIS9M0g6z36B5/QQs76cYqAaYvMvfI=";
      };
    };
  });
  meta = {
    description = "ROS2 Control Hardware Interface for SOARM-100 low-cost 5DoF robotic manipulator.";
  };
})
