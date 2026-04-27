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
  version = "2.26.40-1";
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
        rev = "e18cb19727d4d993eaca4dd458e77f13d7b9e7d5";
        hash = "sha256-ADP/8XygjwhVqwrLFrDpyEE3kRbegXrN0dEmyMEK/Hg=";
      };
    };
  });
  meta = {
    description = "\n    Tooling for ROS 2 built on ros_babel_fish.\n    Provides header-only JSON and YAML serialization for dynamic messages and a CLI tool to echo topics.\n  ";
  };
})
