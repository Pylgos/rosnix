{
  ament-copyright,
  ament-flake8,
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
  version = "0.4.1-3";
  src = finalAttrs.passthru.sources."rpyutils";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rpyutils" = substituteSource {
        src = fetchgit {
          name = "rpyutils-source";
          url = "https://github.com/ros2-gbp/rpyutils-release.git";
          rev = "65683d21b74349178a9e518eeac64287dc528127";
          hash = "sha256-irKkZj0IqKDEwaCIh2Rn3jRQmeR3VI8Gkjah0FuSC0I=";
        };
      };
    });
  };
  meta = {
    description = "Package containing various utility types and functions for Python";
  };
})
