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
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "rosidl_generator_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "7d428cc877416bb6b71790f6a1806cf0c8e9c91b";
        hash = "sha256-5gAeM5LxQ/HaE/VpMX7PW/V2nLyrtIPkmF6d6tVmpUI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosidl_generator_cpp";
  version = "4.6.4-1";
  src = sources."rosidl_generator_cpp";
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
