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
  python3,
  rosidl_cli,
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_type_description = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_type_description-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
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
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake_core python3 rosidl_cli rosidl_parser ];
  buildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedBuildInputs = [ ament_cmake_core rosidl_cli rosidl_parser ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ ament_index_python ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Generate hashes and descriptions of ROS 2 interface types, per REP-2011.";
  };
}
