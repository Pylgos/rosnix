{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  scenario-execution,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "scenario_coverage" = substituteSource {
      src = fetchgit {
        name = "scenario_coverage-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "fd39971a8feb29dee29176a444872ccc2aa31d71";
        hash = "sha256-NfIBq3Wa5KdiE/G8XnYU2sqCkXfSqtpnJhbWwX46wa0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "scenario_coverage";
  version = "1.2.0-3";
  src = finalAttrs.passthru.sources."scenario_coverage";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-defusedxml" "python3-pexpect" "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Robotics Scenario Execution Coverage Tools";
  };
})
