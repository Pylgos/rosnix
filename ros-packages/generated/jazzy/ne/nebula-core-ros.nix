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
  rclcpp,
  ros-environment,
  ros-testing,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_core_ros";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_core_ros";
  nativeBuildInputs = [ autoware-cmake ros-environment ros-testing ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater nebula-core-common rclcpp rosbag2-storage ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ autoware-cmake ros-environment ros-testing ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater nebula-core-common rclcpp rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_core_ros" = substituteSource {
      src = fetchgit {
        name = "nebula_core_ros-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "791199e3f635d47abda68438893c3d0ace7a84f6";
        hash = "sha256-dbuBF54AHXGleKqptYe9vGleTDm8/5vBK73zNN03uZ0=";
      };
    };
  });
  meta = {
    description = "Nebula ROS Base Libraries";
  };
})
