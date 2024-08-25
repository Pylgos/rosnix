{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    ros2cli_test_interfaces = substituteSource {
      src = fetchgit {
        name = "ros2cli_test_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "b1bf6454355b950121990d46c76a3d882a85c461";
        hash = "sha256-IpL1SqU83kbinY4QSBMYJ9v8CmLnWQdwkLedTylh3ZI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2cli_test_interfaces";
  version = "0.32.1-1";
  src = sources.ros2cli_test_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing interface definitions for testing ros2cli.";
  };
}
