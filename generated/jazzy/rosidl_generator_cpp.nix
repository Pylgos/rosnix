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
        rev = "caa7fc9ef84eff9c815e222b9d80723a068ad5b4";
        hash = "sha256-AMnGovzxooayTc4Y9scRE4RwxgvZMa/N22QxrIvWi0w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_cpp";
  version = "4.6.3-1";
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
