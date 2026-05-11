{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-cmake-ros,
  buildAmentCmakePackage,
  cras-cpp-common,
  cras-lint,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-eigen,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "magnetometer_pipeline";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."magnetometer_pipeline";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedNativeBuildInputs = [ cras-cpp-common message-filters pluginlib rclcpp rclcpp-components rclpy sensor-msgs std-msgs std-srvs tf2-eigen ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python3-numpy" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedBuildInputs = [ cras-cpp-common message-filters pluginlib rclcpp rclcpp-components rclpy sensor-msgs std-msgs std-srvs tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-numpy" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-ros cras-lint ];
  passthru.sources = mkSourceSet (sources: {
    "magnetometer_pipeline" = substituteSource {
      src = fetchgit {
        name = "magnetometer_pipeline-source";
        url = "https://github.com/ros2-gbp/compass-release.git";
        rev = "c3f1de123d747eacf2f83537d8a0046dc69e1dfd";
        hash = "sha256-kLaOiMk7XT+pWeHtNySN4vAn2xPit/nDKtl3fbm79/o=";
      };
    };
  });
  meta = {
    description = "Calibration and removing of magnetometer bias.";
  };
})
