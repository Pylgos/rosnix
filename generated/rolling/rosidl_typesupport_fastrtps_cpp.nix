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
  rosidl_generator_cpp,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_fastrtps_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "cf6c7956071ee09ed35a4241f4a02f2bd7349762";
        hash = "sha256-yBJDW/uDnpl8wqP9Zv/BYp5FJsHNgfMO0Yaqg0oI1dk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_fastrtps_cpp";
  version = "3.7.0-1";
  src = sources.rosidl_typesupport_fastrtps_cpp;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_ros fastrtps_cmake_module python3 rosidl_cli rosidl_generator_c rosidl_generator_cpp rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python fastcdr rmw rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common osrf_testing_tools_cpp performance_test_fixture rcutils ];
  missingDependencies = [  ];
  meta = {
    description = "Generate the C++ interfaces for eProsima FastRTPS.";
  };
}
