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
  version = "3.0.2-1";
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
        rev = "37306c643586166e66ca6e3bbf39b74ef0210e8b";
        hash = "sha256-qX0FE6qBN0gDqEEX7uquPn1JZ+EbcGoUFfen04+bWeQ=";
      };
    };
  });
  meta = {
    description = "Common conversions for compass data.";
  };
})
