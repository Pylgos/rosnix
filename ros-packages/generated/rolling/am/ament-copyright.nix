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
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."ament_copyright";
  propagatedNativeBuildInputs = [ ament-lint ];
  propagatedBuildInputs = [ ament-lint ];
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_copyright" = substituteSource {
      src = fetchgit {
        name = "ament_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9c9b8e778f7368ac6d1c6ccac1ada4f296a1eb65";
        hash = "sha256-nBGc8CeNpkLVayLO4WtoAYb91QPcA3nOV/Zcz3aw1+I=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check source files for copyright and license\n    information.\n  ";
  };
})
