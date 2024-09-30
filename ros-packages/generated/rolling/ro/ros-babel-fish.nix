{
  action-tutorials-interfaces,
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "ros_babel_fish" = substituteSource {
      src = fetchgit {
        name = "ros_babel_fish-source";
        url = "https://github.com/ros2-gbp/ros_babel_fish-release.git";
        rev = "72b057f8b5393d4a9eee6ebe458e27fff5f7b709";
        hash = "sha256-XoiEc4FfDXjQDZH62Ttxms7TepvyTOKzO1dGp3HDqDA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros_babel_fish";
  version = "0.9.3-1";
  src = sources."ros_babel_fish";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action-tutorials-interfaces ament-index-cpp geometry-msgs rclcpp rclcpp-action rcpputils rosidl-runtime-cpp rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto example-interfaces geometry-msgs ros-babel-fish-test-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A runtime message handler for ROS. Allows subscription, publishing, calling of services and actions with messages known only at runtime as long as they are available in the local environment.";
  };
}
