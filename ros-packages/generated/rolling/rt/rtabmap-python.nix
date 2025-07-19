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
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_python" = substituteSource {
      src = fetchgit {
        name = "rtabmap_python-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "54a0d809bdbf457252af2b3766e032a7adb33d66";
        hash = "sha256-y5NkYX5dT4x4WPtPiFGdUSCKjlVUw73uCKElsXjahzQ=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's python package.";
  };
})
