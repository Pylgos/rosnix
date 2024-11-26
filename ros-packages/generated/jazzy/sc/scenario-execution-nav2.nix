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
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution_nav2";
  propagatedBuildInputs = [ geometry-msgs lifecycle-msgs nav2-msgs nav2-simple-commander rclpy scenario-execution-ros tf2-ros ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "scenario_execution_nav2" = substituteSource {
        src = fetchgit {
          name = "scenario_execution_nav2-source";
          url = "https://github.com/ros2-gbp/scenario_execution-release.git";
          rev = "a843db52c1d47b642b7c4d461e3af1dbc4319c25";
          hash = "sha256-fUFKyw5Ih3f9tsoyxu+xbmPnncK2Pvtz8bk3w+YhSZo=";
        };
      };
    });
  };
  meta = {
    description = "Scenario Execution library for Nav2";
  };
})
