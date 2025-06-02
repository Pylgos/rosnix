{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  ros-gz-bridge,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "test_ros_gz_bridge";
  version = "1.0.14-1";
  src = finalAttrs.passthru.sources."test_ros_gz_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-gz-bridge ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-gz-bridge ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "test_ros_gz_bridge" = substituteSource {
      src = fetchgit {
        name = "test_ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "5114f21c798121eb37e148140aee3f868cd3c3e7";
        hash = "sha256-1dai7uih7h6/auMrT2niAQ3002O+PEm5u7lkvPKoPss=";
      };
    };
  });
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
})
