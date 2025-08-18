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
  version = "0.26.9-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp rosbag2-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rosbag2-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_cpp" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "1d8e8bee78842aa83470eb7c09e53f2baef86af5";
        hash = "sha256-HOzJvIRR5ptgJgMEYpcRxLSVudKpXdB4oNV4+YT3hPQ=";
      };
    };
  });
  meta = {
    description = "rosbag2 C++ API tutorials and examples";
  };
})
