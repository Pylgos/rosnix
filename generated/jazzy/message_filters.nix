{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_ros,
  ament_lint_auto,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python_cmake_module,
  rclcpp,
  rclcpp_lifecycle,
  rclpy,
  rcutils,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    message_filters = substituteSource {
      src = fetchgit {
        name = "message_filters-source";
        url = "https://github.com/ros2-gbp/ros2_message_filters-release.git";
        rev = "634a1472a26a4d1a8d853965887c577ec44341ec";
        hash = "sha256-i48hBMFojn3h3c6DiL0POTYQsjF1N54I7xhDCkNfw5Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "message_filters";
  version = "4.11.2-1";
  src = sources.message_filters;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclcpp rclpy rcutils std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto rclcpp_lifecycle sensor_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "A set of ROS 2 message filters which take in messages and may output those messages at a later time, based on the conditions that filter needs met.";
  };
}
