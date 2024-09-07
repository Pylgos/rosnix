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
  rosidl_parser,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_introspection_c = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_introspection_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "c1a98410d5f6248fa8488e35b1382a7b9af68fe7";
        hash = "sha256-V0kl0v8lgloe51nsvOVu+ksFibfQRDDv4RXo/NRQcoc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_introspection_c";
  version = "4.6.4-1";
  src = sources.rosidl_typesupport_introspection_c;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake python3 rosidl_cli rosidl_cmake rosidl_generator_c rosidl_parser rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python rosidl_runtime_c rosidl_typesupport_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Generate the message type support for dynamic message construction in C.";
  };
}
