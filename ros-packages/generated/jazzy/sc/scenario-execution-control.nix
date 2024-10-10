{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  scenario-execution,
  scenario-execution-interfaces,
  std-srvs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "scenario_execution_control" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_control-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "1ae5f6db08a07d7adc84de8e8e004e9760ee0489";
        hash = "sha256-A0qHxQ1DtXni2V1fMbzTeEDvRIV0WVE3hq8TiZ0Upd4=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_control";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."scenario_execution_control";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy scenario-execution scenario-execution-interfaces std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Scenario Execution Control";
  };
})
