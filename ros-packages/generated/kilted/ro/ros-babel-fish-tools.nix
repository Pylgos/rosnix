{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  ros-babel-fish,
  ros-babel-fish-test-msgs,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_babel_fish_tools";
  version = "3.26.40-1";
  src = finalAttrs.passthru.sources."ros_babel_fish_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ros-babel-fish yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ros-babel-fish yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gtest geometry-msgs ros-babel-fish-test-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ros_babel_fish_tools" = substituteSource {
      src = fetchgit {
        name = "ros_babel_fish_tools-source";
        url = "https://github.com/ros2-gbp/ros_babel_fish-release.git";
        rev = "ba1a19ef0044da591abb7ad7fee33339623257ef";
        hash = "sha256-2VQBsSP2XHH7zqXuJj7qpHNlWQ9VZlxB8CeslUScFZk=";
      };
    };
  });
  meta = {
    description = "\n    Tooling for ROS 2 built on ros_babel_fish.\n    Provides header-only JSON and YAML serialization for dynamic messages and a CLI tool to echo topics.\n  ";
  };
})
