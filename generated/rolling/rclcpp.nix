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
  performance_test_fixture,
  python3,
  rcl,
  rcl_interfaces,
  rcl_logging_interface,
  rcl_yaml_param_parser,
  rcpputils,
  rcutils,
  rmw,
  rmw_implementation_cmake,
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
  sources = rec {
    rclcpp = substituteSource {
      src = fetchgit {
        name = "rclcpp-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "2a584752729008c95174f12c99afbc3689bb1e1a";
        hash = "sha256-bqDfGUDMbRc6QU9AlBVi0fy424/TtjHiOJpo3plnew4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp";
  version = "28.3.3-1";
  src = sources.rclcpp;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros python3 ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp builtin_interfaces libstatistics_collector rcl rcl_interfaces rcl_logging_interface rcl_yaml_param_parser rcpputils rcutils rmw rosgraph_msgs rosidl_dynamic_typesupport rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_cpp statistics_msgs tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_google_benchmark ament_cmake_gtest ament_lint_auto ament_lint_common mimick_vendor performance_test_fixture rmw rmw_implementation_cmake rosidl_default_generators test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "The ROS client library in C++.";
  };
}
