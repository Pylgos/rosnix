{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rpyutils";
  version = "0.8.0-1";
  src = finalAttrs.passthru.sources."rpyutils";
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rpyutils" = substituteSource {
      src = fetchgit {
        name = "rpyutils-source";
        url = "https://github.com/ros2-gbp/rpyutils-release.git";
        rev = "ae597f2317b30cc515b60e9e59037a5c158a5a07";
        hash = "sha256-/r39JKnzT8esgtNBzY1UlkUu3eNwgo8LQnLqdmozPFA=";
      };
    };
  });
  meta = {
    description = "Package containing various utility types and functions for Python";
  };
})
