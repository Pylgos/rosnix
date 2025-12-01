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
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_control";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_control";
  propagatedNativeBuildInputs = [ rclpy scenario-execution scenario-execution-interfaces std-srvs ];
  propagatedBuildInputs = [ rclpy scenario-execution scenario-execution-interfaces std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_control" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_control-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "571675def651a331a41262a94a7ca26e81d3273b";
        hash = "sha256-s1teRDKURcw9ZhTr++hatDMRKdcRE/F23jeEUhB4vY0=";
      };
    };
  });
  meta = {
    description = "Scenario Execution Control";
  };
})
