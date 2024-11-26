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
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_lint";
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_lint" = substituteSource {
        src = fetchgit {
          name = "ament_lint-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "743e72f2a5a406d647dceeeaec8e201cceebe378";
          hash = "sha256-dEz6J1YJhhpuCG2qc+Su536EpeXGuwXmQ4E86mfZfzE=";
        };
      };
    });
  };
  meta = {
    description = "Providing common API for ament linter packages.";
  };
})
