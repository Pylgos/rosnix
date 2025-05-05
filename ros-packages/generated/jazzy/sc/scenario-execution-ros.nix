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
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_ros";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution_ros";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ py-trees py-trees-ros py-trees-ros-interfaces rcl-interfaces scenario-execution scenario-execution-py-trees-ros visualization-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-transforms3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_ros" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_ros-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "00f6df17b3535ef837d3d2ecc4aaec44b940b60e";
        hash = "sha256-IHmaeAOQH+QAd3E+OKhOozNI/43TJBTkPsmpQUTsE8I=";
      };
    };
  });
  meta = {
    description = "Scenario Execution for ROS";
  };
})
