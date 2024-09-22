{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
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
    nao_sensor_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "nao_sensor_msgs-source";
        owner = "ros2-gbp";
        repo = "nao_interfaces-release";
        rev = "74dded0e1662ddd1fdfe95359a2066528032731d";
        hash = "sha256-z8HBYfJ4SH1kbToGsf6tHPccjImandiilK9gxOLUF90=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_sensor_msgs";
  version = "1.0.0-2";
  src = sources.nao_sensor_msgs;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package defining sensor msgs to be received from NAO robot.";
  };
}
