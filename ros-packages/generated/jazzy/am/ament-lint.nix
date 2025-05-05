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
  version = "0.17.2-1";
  src = finalAttrs.passthru.sources."ament_lint";
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint" = substituteSource {
      src = fetchgit {
        name = "ament_lint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "511c5298a935ea262c8bbb4c74a7622974492988";
        hash = "sha256-7c4qAdRevzU303XVai9F8CSy2P3ngbXw32AIbbSRXPY=";
      };
    };
  });
  meta = {
    description = "\n    Providing common API for ament linter packages.\n  ";
  };
})
