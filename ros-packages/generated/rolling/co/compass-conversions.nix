{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros,
  angles,
  buildAmentCmakePackage,
  compass-interfaces,
  cras-cpp-common,
  cras-lint,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  magnetic-model,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "compass_conversions";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."compass_conversions";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedNativeBuildInputs = [ angles compass-interfaces cras-cpp-common geometry-msgs magnetic-model message-filters pluginlib rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ angles compass-interfaces cras-cpp-common geometry-msgs magnetic-model message-filters pluginlib rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-ros cras-lint ];
  passthru.sources = mkSourceSet (sources: {
    "compass_conversions" = substituteSource {
      src = fetchgit {
        name = "compass_conversions-source";
        url = "https://github.com/ros2-gbp/compass-release.git";
        rev = "46dbe0b80c2b591b7ca5f621856fddc735b3816f";
        hash = "sha256-7N+pJNPRxPq3wOffEJt3tFRbvNOAbqpFT4cWcbV+F38=";
      };
    };
  });
  meta = {
    description = "Common conversions for compass data.";
  };
})
