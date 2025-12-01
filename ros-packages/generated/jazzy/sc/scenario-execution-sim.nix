{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  py-trees,
  rclpy,
  rosSystemPackages,
  scenario-execution-ros,
  simulation-interfaces,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_sim";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_sim";
  propagatedNativeBuildInputs = [ py-trees rclpy scenario-execution-ros simulation-interfaces ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-defusedxml" "python3-transforms3d" ]; };
  propagatedBuildInputs = [ py-trees rclpy scenario-execution-ros simulation-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-transforms3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_sim" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_sim-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "520c993c977893234bf7da640a4c4a5a5e2325a7";
        hash = "sha256-P5wkGAuR8OgYtrbUCfhkIUbfEUOixu3goorC92z+i2E=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for Simulation";
  };
})
