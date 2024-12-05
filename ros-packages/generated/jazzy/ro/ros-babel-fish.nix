{
  action-tutorials-interfaces,
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
  version = "0.10.3-1";
  src = finalAttrs.passthru.sources."ros_babel_fish";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-tutorials-interfaces ament-index-cpp geometry-msgs rclcpp rclcpp-action rcpputils rosidl-runtime-cpp rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto example-interfaces geometry-msgs ros-babel-fish-test-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ros_babel_fish" = substituteSource {
      src = fetchgit {
        name = "ros_babel_fish-source";
        url = "https://github.com/ros2-gbp/ros_babel_fish-release.git";
        rev = "33b0f23b799ee2b685d47b741084b9532912d1fa";
        hash = "sha256-W+h4SmVqpMjfE8Y2t1+XTqILBvIrac+MteBlFAkloh8=";
      };
    };
  });
  meta = {
    description = "A runtime message handler for ROS. Allows subscription, publishing, calling of services and actions with messages known only at runtime as long as they are available in the local environment.";
  };
})
