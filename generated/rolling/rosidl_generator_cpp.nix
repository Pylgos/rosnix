{
  ament_cmake,
  ament_cmake_core,
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
  rosidl_generator_type_description,
  rosidl_parser,
  rosidl_pycommon,
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "30a6b17f2b3a5b93c14cf730ca9f0e2b7203a686";
        hash = "sha256-OlKQpw1cd6XoDIxNwgI9XfvKSpyGDQif/vl2JVrs/hM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_cpp";
  version = "4.8.1-1";
  src = sources.rosidl_generator_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core python3 rosidl_cli rosidl_cmake rosidl_generator_c rosidl_generator_type_description rosidl_parser rosidl_pycommon ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_core rosidl_cli rosidl_cmake rosidl_generator_c rosidl_generator_type_description rosidl_parser rosidl_pycommon ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ ament_index_python rosidl_runtime_cpp ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Generate the ROS interfaces in C++.";
  };
}
