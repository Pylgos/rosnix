{
  action_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  pybind11_vendor,
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
  rosSystemPackages,
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
        rev = "4c7e307c198bd2307ded4fe07831f9d36e27e687";
        hash = "sha256-EsSy0IECOgkELbzSS6vYlTqBQeEBZdH2bdUujpF834I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclpy";
  version = "7.5.0-1";
  src = sources.rclpy;
  nativeBuildInputs = [ ament_cmake python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rmw_implementation_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs ament_index_python builtin_interfaces lifecycle_msgs pybind11_vendor rcl rcl_action rcl_interfaces rcl_lifecycle rcl_logging_interface rcl_yaml_param_parser rcpputils rcutils rmw rmw_implementation rosgraph_msgs rosidl_runtime_c rpyutils unique_identifier_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common rosidl_generator_py test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Package containing the Python client.";
  };
}
