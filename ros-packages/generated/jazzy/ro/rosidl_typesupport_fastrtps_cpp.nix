{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fastcdr,
  fastrtps_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf_testing_tools_cpp,
  performance_test_fixture,
  rcutils,
  rmw,
  rosSystemPackages,
  rosidl_cli,
  rosidl_generator_c,
  rosidl_generator_cpp,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosidl_typesupport_fastrtps_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "251957bd6af1dd6f15113952b69d74aaad79eb5c";
        hash = "sha256-ZEqX9gfGLYVCUifj/xBT95/lQvxtssBJj1kRPdX1Ki8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosidl_typesupport_fastrtps_cpp";
  version = "3.6.0-2";
  src = sources."rosidl_typesupport_fastrtps_cpp";
  nativeBuildInputs = [ ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_ros fastrtps_cmake_module rosidl_cli rosidl_generator_c rosidl_generator_cpp rosidl_pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python fastcdr rmw rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common osrf_testing_tools_cpp performance_test_fixture rcutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generate the C++ interfaces for eProsima FastRTPS.";
  };
}
