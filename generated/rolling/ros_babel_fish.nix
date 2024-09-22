{
  action_tutorials_interfaces,
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  buildRosPackage,
  example_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_action,
  rcpputils,
  rosSystemPackages,
  ros_babel_fish_test_msgs,
  rosidl_runtime_cpp,
  rosidl_typesupport_cpp,
  rosidl_typesupport_introspection_cpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros_babel_fish = substituteSource {
      src = fetchFromGitHub {
        name = "ros_babel_fish-source";
        owner = "ros2-gbp";
        repo = "ros_babel_fish-release";
        rev = "72b057f8b5393d4a9eee6ebe458e27fff5f7b709";
        hash = "sha256-XoiEc4FfDXjQDZH62Ttxms7TepvyTOKzO1dGp3HDqDA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_babel_fish";
  version = "0.9.3-1";
  src = sources.ros_babel_fish;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_tutorials_interfaces ament_index_cpp geometry_msgs rclcpp rclcpp_action rcpputils rosidl_runtime_cpp rosidl_typesupport_cpp rosidl_typesupport_introspection_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_cmake_cppcheck ament_cmake_gtest ament_lint_auto example_interfaces geometry_msgs ros_babel_fish_test_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A runtime message handler for ROS. Allows subscription, publishing, calling of services and actions with messages known only at runtime as long as they are available in the local environment.";
  };
}
