{
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-cmake,
  autoware-sensing-msgs,
  buildAmentCmakePackage,
  continental-msgs,
  continental-srvs,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  nebula-continental-common,
  nebula-continental-decoders,
  nebula-continental-hw-interfaces,
  nebula-core-common,
  nebula-core-ros,
  nebula-msgs,
  radar-msgs,
  rclcpp,
  rclcpp-components,
  ros-environment,
  ros-testing,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
  sync-tooling-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_continental";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_continental";
  nativeBuildInputs = [ autoware-cmake ros-environment ros-testing ];
  propagatedNativeBuildInputs = [ autoware-sensing-msgs continental-msgs continental-srvs diagnostic-msgs diagnostic-updater geometry-msgs message-filters nebula-continental-common nebula-continental-decoders nebula-continental-hw-interfaces nebula-core-common nebula-core-ros nebula-msgs radar-msgs rclcpp rclcpp-components sensor-msgs sync-tooling-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ autoware-cmake ros-environment ros-testing ];
  propagatedBuildInputs = [ autoware-sensing-msgs continental-msgs continental-srvs diagnostic-msgs diagnostic-updater geometry-msgs message-filters nebula-continental-common nebula-continental-decoders nebula-continental-hw-interfaces nebula-core-common nebula-core-ros nebula-msgs radar-msgs rclcpp rclcpp-components sensor-msgs sync-tooling-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ros-testing rosbag2-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_continental" = substituteSource {
      src = fetchgit {
        name = "nebula_continental-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "be85e3274189e4a0de4a87670cca590193def935";
        hash = "sha256-iuIXxunHkg/EA3DyoXbbJyiHz0cWqQeJhFrtLMWFx1k=";
      };
    };
  });
  meta = {
    description = "Nebula Continental ROS Wrapper";
  };
})
