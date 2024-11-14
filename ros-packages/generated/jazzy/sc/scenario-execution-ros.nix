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
  py-trees-ros,
  py-trees-ros-interfaces,
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  scenario-execution,
  scenario-execution-py-trees-ros,
  substituteSource,
  visualization-msgs,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "scenario_execution_ros" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_ros-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "00f6df17b3535ef837d3d2ecc4aaec44b940b60e";
        hash = "sha256-IHmaeAOQH+QAd3E+OKhOozNI/43TJBTkPsmpQUTsE8I=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_ros";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution_ros";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ py-trees py-trees-ros py-trees-ros-interfaces rcl-interfaces rclpy scenario-execution scenario-execution-py-trees-ros visualization-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-transforms3d" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Scenario Execution for ROS";
  };
})
