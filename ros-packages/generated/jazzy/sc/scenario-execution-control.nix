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
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution_control";
  propagatedNativeBuildInputs = [ rclpy scenario-execution scenario-execution-interfaces std-srvs ];
  propagatedBuildInputs = [ rclpy scenario-execution scenario-execution-interfaces std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_control" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_control-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "c926468bf1ffd9b59d3108aeb943ff2769d09f51";
        hash = "sha256-A0qHxQ1DtXni2V1fMbzTeEDvRIV0WVE3hq8TiZ0Upd4=";
      };
    };
  });
  meta = {
    description = "Scenario Execution Control";
  };
})
