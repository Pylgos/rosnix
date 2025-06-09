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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_gazebo";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_gazebo";
  propagatedNativeBuildInputs = [ py-trees rclpy scenario-execution-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-defusedxml" "python3-transforms3d" ]; };
  propagatedBuildInputs = [ py-trees rclpy scenario-execution-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-transforms3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_gazebo" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_gazebo-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "6ba80ed73ec0322a28874467f2c25ea57decacfb";
        hash = "sha256-4eDmx+xB6YYombXfLxfwhuKHTt7tH9jw+scVQfynD54=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for Gazebo";
  };
})
