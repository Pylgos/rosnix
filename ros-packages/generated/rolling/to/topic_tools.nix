{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_runtime_py,
  std_msgs,
  substituteSource,
  topic_tools_interfaces,
}:
let
  sources = mkSourceSet (sources: {
    "topic_tools" = substituteSource {
      src = fetchgit {
        name = "topic_tools-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "ae0033edc0dcb78bfd44bd0c93a55698a85b7c14";
        hash = "sha256-xfICiOdj7/BpaEsO/ab+Z06sHcIqvCXBgHkor4ZF1gg=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "topic_tools";
  version = "1.4.0-1";
  src = sources."topic_tools";
  nativeBuildInputs = [ ament_cmake ament_cmake_python rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components rclpy ros2cli rosidl_runtime_py topic_tools_interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common rosidl_runtime_py std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tools for directing, throttling, selecting, and otherwise messing with ROS 2 topics at a meta level.";
  };
}
