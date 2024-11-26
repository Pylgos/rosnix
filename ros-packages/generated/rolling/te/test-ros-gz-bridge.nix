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
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."test_ros_gz_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-gz-bridge ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "test_ros_gz_bridge" = substituteSource {
        src = fetchgit {
          name = "test_ros_gz_bridge-source";
          url = "https://github.com/ros2-gbp/ros_ign-release.git";
          rev = "b1b0ed4118b4853e9e27995a41e09e3dbe70eaf4";
          hash = "sha256-LH/laOfQq+up99zD2j8+J9UG4ahRE7I6/v+8uIxALb0=";
        };
      };
    });
  };
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
})
