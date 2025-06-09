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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_control";
  propagatedNativeBuildInputs = [ rclpy scenario-execution scenario-execution-interfaces std-srvs ];
  propagatedBuildInputs = [ rclpy scenario-execution scenario-execution-interfaces std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_control" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_control-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "6b09ad6dce8e5f92f58f90208920caeb61722a54";
        hash = "sha256-UJrwrtXeA7RQC011XZlW4XXCVzzUt7osKNGbspPERdc=";
      };
    };
  });
  meta = {
    description = "Scenario Execution Control";
  };
})
