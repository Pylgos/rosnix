{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rcl,
  rcl_interfaces,
  rclc,
  rclcpp,
  rcutils,
  rosidl_runtime_c,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclc_parameter = substituteSource {
      src = fetchgit {
        name = "rclc_parameter-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "6cd4f9aa9c5f72bc49d72fa8159ac31fff78c076";
        hash = "sha256-A93x6TfzcxJIYgtjzdk6WxPcZgdk96frAyeKMnqXQKQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_parameter";
  version = "6.1.0-2";
  src = sources.rclc_parameter;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rcl rcl_interfaces rclc rcutils rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common example_interfaces osrf_testing_tools_cpp rclcpp std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Parameter server implementation for micro-ROS nodes";
  };
}
