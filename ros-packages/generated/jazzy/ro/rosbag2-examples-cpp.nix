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
  version = "0.26.6-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rosbag2-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_cpp" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "aeffbbfcd39f851f0b49df42e6c468340d5d5ea6";
        hash = "sha256-IUlfk3KLCbUn5bWSzqzNZM25bKXKP972NxOX8p9nMBg=";
      };
    };
  });
  meta = {
    description = "rosbag2 C++ API tutorials and examples";
  };
})
