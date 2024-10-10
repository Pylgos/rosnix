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
let
  sources = mkSourceSet (sources: {
    "scenario_execution_nav2" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_nav2-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "8998470da7aae4635a944afe049d05e29f9646b5";
        hash = "sha256-fUFKyw5Ih3f9tsoyxu+xbmPnncK2Pvtz8bk3w+YhSZo=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_nav2";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."scenario_execution_nav2";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs lifecycle-msgs nav2-msgs nav2-simple-commander rclpy scenario-execution-ros tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Scenario Execution library for Nav2";
  };
})
