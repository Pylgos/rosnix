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
  osrf_testing_tools_cpp,
  performance_test_fixture,
  python3,
  rcutils,
  rmw,
  rosidl_cli,
  rosidl_generator_c,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_fastrtps_cpp,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_fastrtps_c = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_fastrtps_c-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "2ad5c9226082ce008ed8c458d042938bd7e385d3";
        hash = "sha256-o79GDWXlyo1dcv4SCHGBhnrLqmIFsWFDgRsB5wJhbi0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_fastrtps_c";
  version = "3.7.0-1";
  src = sources.rosidl_typesupport_fastrtps_c;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_ros fastrtps_cmake_module python3 rosidl_cli rosidl_generator_c rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python fastcdr rmw rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_fastrtps_cpp rosidl_typesupport_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common osrf_testing_tools_cpp performance_test_fixture rcutils ];
  missingDependencies = [  ];
  meta = {
    description = "Generate the C interfaces for eProsima FastRTPS.";
  };
}
