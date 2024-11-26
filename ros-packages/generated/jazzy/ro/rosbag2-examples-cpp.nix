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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_examples_cpp";
  version = "0.26.5-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rosbag2-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbag2_examples_cpp" = substituteSource {
        src = fetchgit {
          name = "rosbag2_examples_cpp-source";
          url = "https://github.com/ros2-gbp/rosbag2-release.git";
          rev = "6757855817a91f7d743bb4b491e26c8a124cf720";
          hash = "sha256-CLjALA4Fp9uA8Bsl9XeQxCJtJ5X5k6tHFNnetoIJCSk=";
        };
      };
    });
  };
  meta = {
    description = "rosbag2 C++ API tutorials and examples";
  };
})
