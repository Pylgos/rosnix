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
  performance_test_fixture,
  python3,
  rcpputils,
  rcutils,
  rosidl_cli,
  rosidl_generator_c,
  rosidl_generator_type_description,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_c,
  rosidl_typesupport_fastrtps_cpp,
  rosidl_typesupport_interface,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "59f9c537ad108522c54f09136b76a8eba3ac152a";
        hash = "sha256-tnLctSk/csqw5TavBsy52puxoT2/DhJml9KIuJygN7I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_cpp";
  version = "3.3.1-1";
  src = sources.rosidl_typesupport_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake_core python3 rosidl_cli rosidl_generator_c rosidl_generator_type_description rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python rcpputils rcutils rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_interface rosidl_typesupport_introspection_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common performance_test_fixture ];
  missingDependencies = [  ];
  meta = {
    description = "Generate the type support for C++ messages.";
  };
}
