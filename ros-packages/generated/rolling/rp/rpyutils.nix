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
  version = "0.6.1-1";
  src = finalAttrs.passthru.sources."rpyutils";
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rpyutils" = substituteSource {
      src = fetchgit {
        name = "rpyutils-source";
        url = "https://github.com/ros2-gbp/rpyutils-release.git";
        rev = "5686fe43da10f8a1189eccf5f7738534f82bef32";
        hash = "sha256-DJfxWL9i/ALymyV8M3UarQZrcMSRx4TNOGr7WBrnU8Y=";
      };
    };
  });
  meta = {
    description = "Package containing various utility types and functions for Python";
  };
})
