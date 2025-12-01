{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  scenario-execution,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "scenario_execution_x11";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_x11";
  propagatedNativeBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ffmpeg" ]; };
  propagatedBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_x11" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_x11-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "507463a00cb4d9e4179c0132dd10afc29390e9a8";
        hash = "sha256-4n5S48mTRObzs7JRLiRdYHZTH5+UQAO9+Jj4D96YOvE=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for X11";
  };
})
