{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav2-msgs,
  nav2-simple-commander,
  rclpy,
  rosSystemPackages,
  scenario-execution-ros,
  substituteSource,
  tf2-ros,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_nav2";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_nav2";
  propagatedNativeBuildInputs = [ geometry-msgs lifecycle-msgs nav2-msgs nav2-simple-commander rclpy scenario-execution-ros tf2-ros ];
  propagatedBuildInputs = [ geometry-msgs lifecycle-msgs nav2-msgs nav2-simple-commander rclpy scenario-execution-ros tf2-ros ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_nav2" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_nav2-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "9cd0dee7f73a3aeb4d0bdc1d89533cce61cef973";
        hash = "sha256-fgu+Yi7Y2Kjk+S233bgcRhwOizFyAf/IVhcFcpAN+DE=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for Nav2";
  };
})
