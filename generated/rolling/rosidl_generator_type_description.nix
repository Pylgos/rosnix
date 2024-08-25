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
        rev = "c1477937519c3411ec0471d28d83fa302549a5ee";
        hash = "sha256-WqFfNNe2Z7xepO/BCbiweNWGHILHBYPAtK7w46u/tRI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_type_description";
  version = "4.8.1-1";
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
