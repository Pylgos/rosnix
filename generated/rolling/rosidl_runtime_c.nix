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
        rev = "c9f71b76ce2957db0d32271093b471f602806085";
        hash = "sha256-LsBMOCV/d7waCHAY7ujB/d/xZgJPHutOM3r+tsECVO0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_c";
  version = "4.8.1-1";
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
