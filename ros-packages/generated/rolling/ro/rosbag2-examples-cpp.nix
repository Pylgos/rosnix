{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-transport,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_examples_cpp";
  version = "0.33.0-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp rosbag2-cpp rosbag2-transport ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rosbag2-cpp rosbag2-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_cpp" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "85985ac5d4c63d8e0996ec0cb1612b2591ea272a";
        hash = "sha256-5BtGCWl3hRDWHYtJ9XwHD6RVpWHdwi1cSMhMwwWPoFc=";
      };
    };
  });
  meta = {
    description = "rosbag2 C++ API tutorials and examples";
  };
})
