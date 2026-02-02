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
  version = "3.0.2-1";
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
        rev = "ad0dfa0022a9ca48b02973d43fe4a88ae7dbf78a";
        hash = "sha256-Mccpxlbe/P0hf8luglfBTFj5m7R53pAWatmtxIOQwtI=";
      };
    };
  });
  meta = {
    description = "Calibration and removing of magnetometer bias.";
  };
})
