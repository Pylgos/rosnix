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
  sources = rec {
    topic_tools-a0ba30f9dc8c3584d61a7e68a53f5467bdd96a2f = substituteSource {
      src = fetchgit {
        name = "topic_tools-a0ba30f9dc8c3584d61a7e68a53f5467bdd96a2f-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "a0ba30f9dc8c3584d61a7e68a53f5467bdd96a2f";
        hash = "sha256-+reIiU8/jPeUnOCDWZQR93SNyZ6jaDvzWR2sMt3K7j8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_tools";
  version = "1.3.1-1";
  src = sources.topic_tools-a0ba30f9dc8c3584d61a7e68a53f5467bdd96a2f;
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
