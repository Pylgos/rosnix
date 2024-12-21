{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
  rclcpp,
  rcutils,
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_test_common";
  version = "0.26.6-1";
  src = finalAttrs.passthru.sources."rosbag2_test_common";
  nativeBuildInputs = [ ament-cmake ament-cmake-python python-cmake-module ];
  propagatedBuildInputs = [ rclcpp rcutils test-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_test_common" = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_common-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "7594568c2dd6ea8e232ff8e9b3d3c33c4d6bb561";
        hash = "sha256-X8+KJju0I9473noafxX80xVEvvzz8MOWKecx6GXL4OI=";
      };
    };
  });
  meta = {
    description = "Commonly used test helper classes and fixtures for rosbag2";
  };
})
