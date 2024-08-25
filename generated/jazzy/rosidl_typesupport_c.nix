{
  ament_cmake_core,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mimick_vendor,
  performance_test_fixture,
  python3,
  rcpputils,
  rcutils,
  rosidl_cli,
  rosidl_generator_c,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_typesupport_fastrtps_c,
  rosidl_typesupport_interface,
  rosidl_typesupport_introspection_c,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_c = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_c-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "5dea37cf7a79d5651289f3f65380399f15febf5d";
        hash = "sha256-JCYXTlvnyR+O2YgS8alsztQk5kBOkkxeZ86LyuTNIbw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_c";
  version = "3.2.2-1";
  src = sources.rosidl_typesupport_c;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake_core python3 rosidl_cli rosidl_generator_c rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python rcpputils rcutils rosidl_runtime_c rosidl_typesupport_fastrtps_c rosidl_typesupport_interface rosidl_typesupport_introspection_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common mimick_vendor performance_test_fixture ];
  missingDependencies = [  ];
  meta = {
    description = "Generate the type support for C messages.";
  };
}
