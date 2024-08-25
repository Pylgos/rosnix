{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_components,
  rmw_fastrtps_cpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    demo_nodes_cpp_native = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp_native-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "af9c8b310f26ead4b23392f22418b464a2029229";
        hash = "sha256-wJhu0peCUdKL5aq94ACi+fybAiJvJH8YMQaDSCK4G8c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_cpp_native";
  version = "0.34.2-1";
  src = sources.demo_nodes_cpp_native;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rmw_fastrtps_cpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros ];
  missingDependencies = [  ];
  meta = {
    description = "C++ nodes which access the native handles of the rmw implementation.";
  };
}
