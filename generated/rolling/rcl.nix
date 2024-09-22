{
  ament_cmake_gen_version_h,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
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
    rcl = substituteSource {
      src = fetchFromGitHub {
        name = "rcl-source";
        owner = "ros2-gbp";
        repo = "rcl-release";
        rev = "835ad62c4d7e2a7b90e9b4d6155d52a60ce68960";
        hash = "sha256-uqrAQ9kh2zscOf18YSX9OgaRhlrfcAlRuagZfVIIRdg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl";
  version = "9.4.1-1";
  src = sources.rcl;
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
