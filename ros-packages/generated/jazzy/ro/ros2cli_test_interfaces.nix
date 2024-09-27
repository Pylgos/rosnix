{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    ros2cli_test_interfaces-b1bf6454355b950121990d46c76a3d882a85c461 = substituteSource {
      src = fetchgit {
        name = "ros2cli_test_interfaces-b1bf6454355b950121990d46c76a3d882a85c461-source";
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
  src = sources.ros2cli_test_interfaces-b1bf6454355b950121990d46c76a3d882a85c461;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing interface definitions for testing ros2cli.";
  };
}
