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
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."so_arm_100_hardware";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ hardware-interface pluginlib rclcpp rclcpp-lifecycle std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ hardware-interface pluginlib rclcpp rclcpp-lifecycle std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "so_arm_100_hardware" = substituteSource {
      src = fetchgit {
        name = "so_arm_100_hardware-source";
        url = "https://github.com/brukg/so_arm_100_hardware-release.git";
        rev = "42a4368898d80091bd7752345e1dfdda34383570";
        hash = "sha256-YZZ38dDp8tNPh5oAXsBbP4SNYLjZn387RkFDioQ1S0s=";
      };
    };
  });
  meta = {
    description = "ROS2 Control Hardware Interface for SOARM-100 low-cost 5DoF robotic manipulator.";
  };
})
