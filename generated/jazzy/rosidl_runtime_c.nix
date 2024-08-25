{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rcutils,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_runtime_c = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "4bfad483abc1bb0601ea6406b1de7e8b11230f1c";
        hash = "sha256-NMDm5IYafAIZ7tuU5wLvFPN1Xjt4+RU+nh6tKOdkB9g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_c";
  version = "4.6.3-1";
  src = sources.rosidl_runtime_c;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils rosidl_typesupport_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common performance_test_fixture ];
  missingDependencies = [  ];
  meta = {
    description = "Provides definitions, initialization and finalization functions, and macros for getting and working with rosidl typesupport types in C.";
  };
}
