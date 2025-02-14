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
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_python" = substituteSource {
      src = fetchgit {
        name = "rtabmap_python-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "f7cacdfa8b785477ddab43f4ccc045820c9d9f5b";
        hash = "sha256-Wagv2OTuOHAcBHZArEC+rFLOhKJQ8xONptMcegB85cY=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's python package.";
  };
})
