{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildRosPackage,
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
        rev = "64ea753f207cefcce1016976867765f8744c585c";
        hash = "sha256-jzgSo2mMBkttGaQFSROZqXETnDmtgNcbDO2z0NWByAs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "scenario_execution_gazebo";
  version = "1.2.0-3";
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