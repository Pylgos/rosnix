{
  ament-cmake,
  ament-cmake-gmock,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcpputils,
  ros2bag,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-compression-zstd,
  rosbag2-cpp,
  rosbag2-interfaces,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-test-common,
  rosbag2-transport,
  std-msgs,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_tests";
  version = "0.26.8-1";
  src = finalAttrs.passthru.sources."rosbag2_tests";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rclcpp rcpputils ros2bag rosbag2-compression rosbag2-compression-zstd rosbag2-cpp rosbag2-interfaces rosbag2-storage rosbag2-storage-default-plugins rosbag2-test-common rosbag2-transport std-msgs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_tests" = substituteSource {
      src = fetchgit {
        name = "rosbag2_tests-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "8a3b5501baedffcc97cb3ef27baca2a4a1b1b363";
        hash = "sha256-+V6aKjr/eUFSdqes3PH43SqLBC6hc67mE4plEJxZZD4=";
      };
    };
  });
  meta = {
    description = "Tests package for rosbag2";
  };
})
