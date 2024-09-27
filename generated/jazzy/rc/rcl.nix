{
  ament_cmake_gen_version_h,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  libyaml_vendor,
  mimick_vendor,
  osrf_testing_tools_cpp,
  rcl_interfaces,
  rcl_logging_interface,
  rcl_logging_noop,
  rcl_logging_spdlog,
  rcl_yaml_param_parser,
  rcutils,
  rmw,
  rmw_implementation,
  rmw_implementation_cmake,
  rosSystemPackages,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  service_msgs,
  substituteSource,
  test_msgs,
  tracetools,
  type_description_interfaces,
}:
let
  sources = rec {
    rcl-597ca55510c71abcb3f02844af4b24e8c70889dd = substituteSource {
      src = fetchgit {
        name = "rcl-597ca55510c71abcb3f02844af4b24e8c70889dd-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "597ca55510c71abcb3f02844af4b24e8c70889dd";
        hash = "sha256-OOucNZZySebA6e8QkC32n3a0DymluHTlLxRHdesNxIk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl";
  version = "9.2.4-1";
  src = sources.rcl-597ca55510c71abcb3f02844af4b24e8c70889dd;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ libyaml_vendor rcl_interfaces rcl_logging_interface rcl_logging_noop rcl_logging_spdlog rcl_yaml_param_parser rcutils rmw rmw_implementation rosidl_runtime_c service_msgs tracetools type_description_interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake mimick_vendor osrf_testing_tools_cpp rmw rmw_implementation_cmake rosidl_runtime_cpp test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ROS client library common implementation. This package contains an API which builds on the ROS middleware API and is optionally built upon by the other ROS client libraries.";
  };
}
