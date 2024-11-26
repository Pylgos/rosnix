{
  ament-copyright,
  ament-flake8,
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
  pname = "rtabmap_python";
  version = "0.21.5-3";
  src = finalAttrs.passthru.sources."rtabmap_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rtabmap_python" = substituteSource {
        src = fetchgit {
          name = "rtabmap_python-source";
          url = "https://github.com/introlab/rtabmap_ros-release.git";
          rev = "de46ffbf511fc67a7d4ed7d3138f3b371ad6ca33";
          hash = "sha256-BAkiOWJxqmytuyxSALt33GudRjNjfpI3j3J7DPMDkGA=";
        };
      };
    });
  };
  meta = {
    description = "RTAB-Map's python package.";
  };
})
