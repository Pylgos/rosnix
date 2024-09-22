{
  ament_cmake,
  ament_cmake_core,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
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
      src = fetchFromGitHub {
        name = "rosidl_generator_cpp-source";
        owner = "ros2-gbp";
        repo = "rosidl-release";
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core rosidl_cli rosidl_cmake rosidl_generator_c rosidl_generator_type_description rosidl_parser rosidl_pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core rosidl_cli rosidl_cmake rosidl_generator_c rosidl_generator_type_description rosidl_parser rosidl_pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [ ament_index_python rosidl_runtime_cpp ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generate the ROS interfaces in C++.";
  };
}
