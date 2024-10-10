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
let
  sources = mkSourceSet (sources: {
    "scenario_execution_gazebo" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_gazebo-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "c782b91821dc7f5e8888a1368f0ae3a8ee9cea19";
        hash = "sha256-jzgSo2mMBkttGaQFSROZqXETnDmtgNcbDO2z0NWByAs=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_gazebo";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."scenario_execution_gazebo";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ py-trees rclpy scenario-execution-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-transforms3d" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Scenario Execution library for Gazebo";
  };
})
