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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_x11";
  propagatedNativeBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ffmpeg" ]; };
  propagatedBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_x11" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_x11-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "70bb206edb54929195762c37f27a98a4fdb8cb25";
        hash = "sha256-Ys7Kg+5tj47iYuSBT+ZC2sDWA3eLTItEeUa7if/1Kxk=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for X11";
  };
})
