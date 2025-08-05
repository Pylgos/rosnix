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
  version = "0.7.1-1";
  src = finalAttrs.passthru.sources."rpyutils";
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rpyutils" = substituteSource {
      src = fetchgit {
        name = "rpyutils-source";
        url = "https://github.com/ros2-gbp/rpyutils-release.git";
        rev = "1ca087ac71e1bdd1fe1da92b1515a0f8ea8f1025";
        hash = "sha256-vVQDK7wRidOWE2sSu09Fz61KyxYDvrL831/TA09E62s=";
      };
    };
  });
  meta = {
    description = "Package containing various utility types and functions for Python";
  };
})
