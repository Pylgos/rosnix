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
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution_x11";
  propagatedBuildInputs = [ scenario-execution ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_x11" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_x11-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "ec458a7cd5080966954b83a647c708d4c5d27434";
        hash = "sha256-0mfaHzBK0uJhe/roxrY6H3jr2gcfXAMHYFTuv/H7Mb4=";
      };
    };
  });
  meta = {
    description = "Scenario Execution library for X11";
  };
})
