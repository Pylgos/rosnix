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
  substituteSource,
  visualization-msgs,
  xacro,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_ros";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_ros";
  propagatedNativeBuildInputs = [ py-trees py-trees-ros py-trees-ros-interfaces rcl-interfaces rclpy scenario-execution visualization-msgs xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-transforms3d" ]; };
  propagatedBuildInputs = [ py-trees py-trees-ros py-trees-ros-interfaces rcl-interfaces rclpy scenario-execution visualization-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-transforms3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_ros" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_ros-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "66a51a949d9ccef022bffc1c07fb5664ebe73852";
        hash = "sha256-FoaMf9kidaqhDigAufYokZeP0VASTUGgGfbBCBcwFmw=";
      };
    };
  });
  meta = {
    description = "Scenario Execution for ROS";
  };
})
