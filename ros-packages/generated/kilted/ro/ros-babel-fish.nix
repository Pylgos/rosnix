{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rcpputils,
  ros-babel-fish-test-msgs,
  rosSystemPackages,
  rosidl-runtime-cpp,
  rosidl-typesupport-cpp,
  rosidl-typesupport-introspection-cpp,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_babel_fish";
  version = "3.26.31-1";
  src = finalAttrs.passthru.sources."ros_babel_fish";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp example-interfaces geometry-msgs rclcpp rclcpp-action rcpputils rosidl-runtime-cpp rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp example-interfaces geometry-msgs rclcpp rclcpp-action rcpputils rosidl-runtime-cpp rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto geometry-msgs ros-babel-fish-test-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ros_babel_fish" = substituteSource {
      src = fetchgit {
        name = "ros_babel_fish-source";
        url = "https://github.com/ros2-gbp/ros_babel_fish-release.git";
        rev = "87e966e8290b1c363d1a635d90be74850b918153";
        hash = "sha256-PEd7k/IOBMYZio2HI9dQMw+A4Dat8G0NpsH+9S4mnJ8=";
      };
    };
  });
  meta = {
    description = "\n    A runtime message handler for ROS.\n    Allows subscription, publishing, calling of services and actions with messages known only at runtime as long\n    as they are available in the local environment.\n  ";
  };
})
