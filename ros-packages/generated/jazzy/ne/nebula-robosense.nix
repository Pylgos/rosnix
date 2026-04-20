{
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-cmake,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-decoders,
  nebula-core-hw-interfaces,
  nebula-core-ros,
  nebula-msgs,
  nebula-robosense-common,
  nebula-robosense-decoders,
  nebula-robosense-hw-interfaces,
  rclcpp,
  rclcpp-components,
  robosense-msgs,
  ros-environment,
  ros-testing,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_robosense";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_robosense";
  nativeBuildInputs = [ autoware-cmake ros-environment ros-testing ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater nebula-core-common nebula-core-decoders nebula-core-hw-interfaces nebula-core-ros nebula-msgs nebula-robosense-common nebula-robosense-decoders nebula-robosense-hw-interfaces rclcpp rclcpp-components robosense-msgs sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "yaml-cpp" ]; };
  buildInputs = [ autoware-cmake ros-environment ros-testing ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater nebula-core-common nebula-core-decoders nebula-core-hw-interfaces nebula-core-ros nebula-msgs nebula-robosense-common nebula-robosense-decoders nebula-robosense-hw-interfaces rclcpp rclcpp-components robosense-msgs sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_robosense" = substituteSource {
      src = fetchgit {
        name = "nebula_robosense-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "c5361397152c078ce2d9cd516feef4ef4eed2f62";
        hash = "sha256-pDTO/u9Zwr/wTyKoJd/YKB4rejbgpr8pdF2y1m1bdP8=";
      };
    };
  });
  meta = {
    description = "Nebula Robosense ROS Wrapper";
  };
})
