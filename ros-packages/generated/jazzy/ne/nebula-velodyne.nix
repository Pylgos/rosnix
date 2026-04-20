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
  nebula-velodyne-common,
  nebula-velodyne-decoders,
  nebula-velodyne-hw-interfaces,
  rclcpp,
  rclcpp-components,
  ros-environment,
  ros-testing,
  rosSystemPackages,
  rosbag2-cpp,
  substituteSource,
  velodyne-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_velodyne";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_velodyne";
  nativeBuildInputs = [ autoware-cmake ros-environment ros-testing ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater nebula-core-common nebula-core-decoders nebula-core-hw-interfaces nebula-core-ros nebula-msgs nebula-velodyne-common nebula-velodyne-decoders nebula-velodyne-hw-interfaces rclcpp rclcpp-components velodyne-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "yaml-cpp" ]; };
  buildInputs = [ autoware-cmake ros-environment ros-testing ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater nebula-core-common nebula-core-decoders nebula-core-hw-interfaces nebula-core-ros nebula-msgs nebula-velodyne-common nebula-velodyne-decoders nebula-velodyne-hw-interfaces rclcpp rclcpp-components velodyne-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ros-testing rosbag2-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_velodyne" = substituteSource {
      src = fetchgit {
        name = "nebula_velodyne-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "cbd2d8b1de2bb2664fe83728f4ddd768d682d7cd";
        hash = "sha256-3HAYPx8+dk1vUpk9j2x6yitWQIFvmiEUeSmLANQL6m8=";
      };
    };
  });
  meta = {
    description = "Nebula Velodyne ROS Wrapper";
  };
})
