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
  rosbag2-compression,
  rosbag2-cpp,
  rosbag2-transport,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_examples_cpp";
  version = "0.34.0-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp rosbag2-compression rosbag2-cpp rosbag2-transport ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rosbag2-compression rosbag2-cpp rosbag2-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_cpp" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "b5741af3e808a6f6d020915a6e454b869a57ef0c";
        hash = "sha256-PSKnaBFYxxu7xfGI7IkSBq4RD5L+Z7SFgzrRoI1lEt4=";
      };
    };
  });
  meta = {
    description = "rosbag2 C++ API tutorials and examples";
  };
})
