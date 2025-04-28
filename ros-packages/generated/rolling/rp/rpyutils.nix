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
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."rpyutils";
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rpyutils" = substituteSource {
      src = fetchgit {
        name = "rpyutils-source";
        url = "https://github.com/ros2-gbp/rpyutils-release.git";
        rev = "62bbdad888d89adbf56087bf366dc0c64470d206";
        hash = "sha256-qeoOiZ4yfzlNEOeoiAUSyUX/BYaxOj58ohveNZRlzrk=";
      };
    };
  });
  meta = {
    description = "Package containing various utility types and functions for Python";
  };
})
