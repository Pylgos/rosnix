{
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-utils-debug,
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
  nebula-hesai-common,
  nebula-hesai-decoders,
  nebula-hesai-hw-interfaces,
  nebula-msgs,
  pandar-msgs,
  rclcpp,
  rclcpp-components,
  ros-environment,
  ros-testing,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
  sync-tooling-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_hesai";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_hesai";
  nativeBuildInputs = [ autoware-cmake ros-environment ros-testing ];
  propagatedNativeBuildInputs = [ autoware-internal-debug-msgs autoware-utils-debug diagnostic-msgs diagnostic-updater nebula-core-common nebula-core-decoders nebula-core-hw-interfaces nebula-core-ros nebula-hesai-common nebula-hesai-decoders nebula-hesai-hw-interfaces nebula-msgs pandar-msgs rclcpp rclcpp-components sensor-msgs sync-tooling-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ autoware-cmake ros-environment ros-testing ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs autoware-utils-debug diagnostic-msgs diagnostic-updater nebula-core-common nebula-core-decoders nebula-core-hw-interfaces nebula-core-ros nebula-hesai-common nebula-hesai-decoders nebula-hesai-hw-interfaces nebula-msgs pandar-msgs rclcpp rclcpp-components sensor-msgs sync-tooling-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ros-testing rosbag2-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_hesai" = substituteSource {
      src = fetchgit {
        name = "nebula_hesai-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "7acd7c3bd534a8b8d2be6ab64c9d65257ba691bd";
        hash = "sha256-DNptaK2ngPTnJyy9tW8jLaLbnt2p4MyTx93/Degiyu0=";
      };
    };
  });
  meta = {
    description = "Nebula Hesai ROS Wrapper";
  };
})
