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
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_lint";
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_lint" = substituteSource {
        src = fetchgit {
          name = "ament_lint-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "010424fc1032034b0bf53e21d470e8c1d24d8716";
          hash = "sha256-5knofdyuB91p4Cw6e0S7mSgS6cZ4PL/UOKMWWd+zByg=";
        };
      };
    });
  };
  meta = {
    description = "Providing common API for ament linter packages.";
  };
})
