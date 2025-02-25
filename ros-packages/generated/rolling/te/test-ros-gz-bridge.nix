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
  version = "2.1.5-1";
  src = finalAttrs.passthru.sources."test_ros_gz_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-gz-bridge ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "test_ros_gz_bridge" = substituteSource {
      src = fetchgit {
        name = "test_ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "72ed4c77790a47a43abccef61a194f73ebc280a9";
        hash = "sha256-C1jcE59SZIi7fLmhOZzpZi0Cg5yzrPB3/5Gm/y1k118=";
      };
    };
  });
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
})
