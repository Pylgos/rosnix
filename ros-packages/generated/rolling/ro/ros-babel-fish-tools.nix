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
  version = "4.26.43-1";
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
        rev = "e6de6654aa04e8dd8a41be45169fd960359cbec2";
        hash = "sha256-cYcah4Z5hiuq15XGfN6WIOicccKNmV21a+rR2bUA14g=";
      };
    };
  });
  meta = {
    description = "\n    Tooling for ROS 2 built on ros_babel_fish.\n    Provides header-only JSON and YAML serialization for dynamic messages and a CLI tool to echo topics.\n  ";
  };
})
