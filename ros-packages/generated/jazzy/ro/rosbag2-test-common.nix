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
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_test_common";
  version = "0.26.9-1";
  src = finalAttrs.passthru.sources."rosbag2_test_common";
  nativeBuildInputs = [ ament-cmake ament-cmake-python python-cmake-module ];
  propagatedNativeBuildInputs = [ rclcpp rcpputils rcutils test-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python python-cmake-module ];
  propagatedBuildInputs = [ rclcpp rcpputils rcutils test-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_test_common" = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_common-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "81b13b00b33148ace4b0f9dc5083ff5629a323cb";
        hash = "sha256-lQXN5jkRULEBnpgdAUAByYWS75wJRNNzgMw5/xPH0dU=";
      };
    };
  });
  meta = {
    description = "Commonly used test helper classes and fixtures for rosbag2";
  };
})
