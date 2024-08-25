{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  test_interface_files,
}:
let
  sources = rec {
    test_msgs = substituteSource {
      src = fetchgit {
        name = "test_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "243133eade9f4c62910ae3f73e47cfd6d8dc4ef1";
        hash = "sha256-ZPfkWltGHjaGtM/X7GCw9+cEgLLNY85dCvcXLwMkFxg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_msgs";
  version = "2.2.0-1";
  src = sources.test_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime test_interface_files ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
}
