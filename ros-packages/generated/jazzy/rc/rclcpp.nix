{
  ament_cmake_gen_version_h,
  ament_cmake_gmock,
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  libstatistics_collector,
  mimick_vendor,
  mkSourceSet,
  performance_test_fixture,
  rcl,
  rcl_interfaces,
  rcl_logging_interface,
  rcl_yaml_param_parser,
  rcpputils,
  rcutils,
  rmw,
  rmw_implementation_cmake,
  rosSystemPackages,
  rosgraph_msgs,
  rosidl_default_generators,
  rosidl_dynamic_typesupport,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_c,
  rosidl_typesupport_cpp,
  statistics_msgs,
  substituteSource,
  test_msgs,
  tracetools,
}:
let
  sources = mkSourceSet (sources: {
    "rclcpp" = substituteSource {
      src = fetchgit {
        name = "rclcpp-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "725693dab47a5b65aa8631b4fe03bfa21fe5ea7f";
        hash = "sha256-BMNYlzGpWN34ozMIk2Lvte6dN0QxJ0yxGs0VeTxYnFs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rclcpp";
  version = "28.1.5-1";
  src = sources."rclcpp";
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp builtin_interfaces libstatistics_collector rcl rcl_interfaces rcl_logging_interface rcl_yaml_param_parser rcpputils rcutils rmw rosgraph_msgs rosidl_dynamic_typesupport rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_cpp statistics_msgs tracetools ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_google_benchmark ament_cmake_gtest ament_lint_auto ament_lint_common mimick_vendor performance_test_fixture rmw rmw_implementation_cmake rosidl_default_generators test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ROS client library in C++.";
  };
}
