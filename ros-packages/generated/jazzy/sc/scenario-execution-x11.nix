{
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
    "scenario_execution_x11" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_x11-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "b72d3fad5a884ca34fd4af2efdc16663619161c7";
        hash = "sha256-0mfaHzBK0uJhe/roxrY6H3jr2gcfXAMHYFTuv/H7Mb4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "scenario_execution_x11";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."scenario_execution_x11";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Scenario Execution library for X11";
  };
})
