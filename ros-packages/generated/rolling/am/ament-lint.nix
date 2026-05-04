{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_lint";
  version = "0.20.5-3";
  src = finalAttrs.passthru.sources."ament_lint";
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint" = substituteSource {
      src = fetchgit {
        name = "ament_lint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "d30fb965a2b88616d023f0bcee35e8392dd87c8b";
        hash = "sha256-l/CR6KerwHAVzQgH/f29KV0+7sK75NaNLAfq5vhoqAw=";
      };
    };
  });
  meta = {
    description = "\n    Providing common API for ament linter packages.\n  ";
  };
})
