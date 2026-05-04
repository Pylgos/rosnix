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
  version = "0.20.5-3";
  src = finalAttrs.passthru.sources."ament_copyright";
  propagatedNativeBuildInputs = [ ament-lint ];
  propagatedBuildInputs = [ ament-lint ];
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_copyright" = substituteSource {
      src = fetchgit {
        name = "ament_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "98e0fc3b3fc09a8ba921f655b5b93d161f599e86";
        hash = "sha256-cOoFdAG0kF/tR/Ua9lY/ax6i1iut+r5wd37E69QNre0=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check source files for copyright and license\n    information.\n  ";
  };
})
