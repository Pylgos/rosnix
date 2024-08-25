{
  action_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  pybind11_vendor,
  python3Packages,
  python_cmake_module,
  rcl,
  rcl_action,
  rcl_interfaces,
  rcl_lifecycle,
  rcl_logging_interface,
  rcl_yaml_param_parser,
  rcpputils,
  rcutils,
  rmw,
  rmw_implementation,
  rmw_implementation_cmake,
  rosgraph_msgs,
  rosidl_generator_py,
  rosidl_runtime_c,
  rpyutils,
  substituteSource,
  test_msgs,
  unique_identifier_msgs,
}:
let
  sources = rec {
    rclpy = substituteSource {
      src = fetchgit {
        name = "rclpy-source";
        url = "https://github.com/ros2-gbp/rclpy-release.git";
        rev = "05f2d82710ff0e7ed52b15f8353443df442dfac0";
        hash = "sha256-BSf+cbcOUVpJK5gtEz0d4ymuruqqFGkmdNy6K+j5emY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclpy";
  version = "7.1.1-2";
  src = sources.rclpy;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml rmw_implementation_cmake rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs ament_index_python builtin_interfaces lifecycle_msgs pybind11_vendor rcl rcl_action rcl_interfaces rcl_lifecycle rcl_logging_interface rcl_yaml_param_parser rcpputils rcutils rmw rmw_implementation rosgraph_msgs rosidl_runtime_c unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common python3Packages.pytest rosidl_generator_py test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing the Python client.";
  };
}
