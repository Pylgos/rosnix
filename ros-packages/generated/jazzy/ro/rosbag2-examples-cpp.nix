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
  version = "0.26.7-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rosbag2-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_cpp" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "1e4ad6acb0b7a36f9a4b338ff39c552297ddc082";
        hash = "sha256-CXmhjFcQ/IVwR3z/SKN6m6W0OujzGmYEwAHqWpp9wCg=";
      };
    };
  });
  meta = {
    description = "rosbag2 C++ API tutorials and examples";
  };
})
