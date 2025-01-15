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
  version = "2.1.3-2";
  src = finalAttrs.passthru.sources."test_ros_gz_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-gz-bridge ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "test_ros_gz_bridge" = substituteSource {
      src = fetchgit {
        name = "test_ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "7dce265fc8013e2d55ccd274cb15285f83c90ad2";
        hash = "sha256-prwMa90aLLHLDj7UmHaTQpIkVRhn0PX43q1/uhRTU4k=";
      };
    };
  });
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
})
