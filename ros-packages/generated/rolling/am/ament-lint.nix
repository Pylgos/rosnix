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
  version = "0.19.2-1";
  src = finalAttrs.passthru.sources."ament_lint";
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint" = substituteSource {
      src = fetchgit {
        name = "ament_lint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9ac3a6ea956168fec8cdbabb0ae839f826eeb05c";
        hash = "sha256-r7BLQcy36qqBAPcJjRSMerVZqlgY/pGM3mX1iHF+n9c=";
      };
    };
  });
  meta = {
    description = "Providing common API for ament linter packages.";
  };
})
