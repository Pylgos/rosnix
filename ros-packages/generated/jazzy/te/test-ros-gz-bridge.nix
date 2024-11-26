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
  version = "1.0.7-1";
  src = finalAttrs.passthru.sources."test_ros_gz_bridge";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-gz-bridge ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch-ros launch-testing launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "test_ros_gz_bridge" = substituteSource {
      src = fetchgit {
        name = "test_ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "ec6a1dd40cb63d2c8cbd6d5deb420cc1179ceee0";
        hash = "sha256-nf5FqGZ+XyjReYljVqCQpoihHaJ6lxHqc5fjqUAMydg=";
      };
    };
  });
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
})
