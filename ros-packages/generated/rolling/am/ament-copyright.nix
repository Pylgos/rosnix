{
  ament-flake8,
  ament-lint,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_copyright";
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."ament_copyright";
  propagatedNativeBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" ]; };
  propagatedBuildInputs = [ ament-lint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" ]; };
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_copyright" = substituteSource {
      src = fetchgit {
        name = "ament_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "4c4409cab2a1f675514a81a38d3d2aaa14cc92a4";
        hash = "sha256-/fdvGTwQ6/mVJoA3qw54JE9PYyac60EgX7prFfDTk2I=";
      };
    };
  });
  meta = {
    description = "The ability to check source files for copyright and license information.";
  };
})
