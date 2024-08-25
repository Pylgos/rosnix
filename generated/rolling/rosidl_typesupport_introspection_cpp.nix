{
  ament_cmake,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  rosidl_cli,
  rosidl_cmake,
  rosidl_generator_c,
  rosidl_generator_cpp,
  rosidl_parser,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_interface,
  rosidl_typesupport_introspection_c,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_introspection_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_introspection_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "21412e165fd647bef25d1d1bec6af082090501ab";
        hash = "sha256-Z8tsrt1V2RB8spx+zoaz+g31QMgvB0G8nm5/4M/jUu0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_introspection_cpp";
  version = "4.8.1-1";
  src = sources.rosidl_typesupport_introspection_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake python3 rosidl_cli rosidl_cmake rosidl_generator_c rosidl_generator_cpp rosidl_parser rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_interface rosidl_typesupport_introspection_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Generate the message type support for dynamic message construction in C++.";
  };
}
