{
  ament_cmake_core,
  ament_cmake_python,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcutils,
  rosSystemPackages,
  rosidl_cli,
  rosidl_cmake,
  rosidl_generator_type_description,
  rosidl_parser,
  rosidl_pycommon,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_c = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "d3189fbf89aad16ab7e1339774623b4fb4a51f25";
        hash = "sha256-8i16K1RL9GTKa0QnNu/tUdk+ttHU2KigR7z76orYnrY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_c";
  version = "4.8.1-1";
  src = sources.rosidl_generator_c;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core rosidl_cli rosidl_cmake rosidl_generator_type_description rosidl_parser rosidl_pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament_cmake_python ament_cmake_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core rosidl_cli rosidl_cmake rosidl_generator_type_description rosidl_parser rosidl_pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [ ament_index_python rcutils rosidl_typesupport_interface ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generate the ROS interfaces in C.";
  };
}
