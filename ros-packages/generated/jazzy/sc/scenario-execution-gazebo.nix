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
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution_gazebo";
  propagatedBuildInputs = [ py-trees rclpy scenario-execution-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-transforms3d" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_gazebo" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_gazebo-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "d722e4dd777f40f821eca09758fe56d5e047aac3";
        hash = "sha256-jzgSo2mMBkttGaQFSROZqXETnDmtgNcbDO2z0NWByAs=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for Gazebo";
  };
})
