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
        rev = "d20e814fe2e038b50aa6e754fc19da126df8c7e4";
        hash = "sha256-MoUipm0J/605NCNGEqWREPTHLjuJ6Q8xJBWiO6LpuUA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_c";
  version = "4.6.4-1";
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
