{
  ament_cmake_core,
  ament_cmake_python,
  ament_cmake_ros,
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
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_type_description = substituteSource {
      src = fetchFromGitHub {
        name = "rosidl_generator_type_description-source";
        owner = "ros2-gbp";
        repo = "rosidl-release";
        rev = "2658b5c7feaf5787efdee9b81112684c608da99c";
        hash = "sha256-c98D7RfhghgAqr+EgAFQzdmhR7n+q+tIkS7SEXI9JuE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_type_description";
  version = "4.6.4-1";
  src = sources.rosidl_generator_type_description;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core rosidl_cli rosidl_parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament_cmake_python ament_cmake_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core rosidl_cli rosidl_parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [ ament_index_python ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generate hashes and descriptions of ROS 2 interface types, per REP-2011.";
  };
}
