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
  pname = "ament_index_python";
  version = "1.10.2-1";
  src = finalAttrs.passthru.sources."ament_index_python";
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_index_python" = substituteSource {
      src = fetchgit {
        name = "ament_index_python-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "8ddc1be5b32d97a93d31ea31582b54a1f8023dd8";
        hash = "sha256-NcEkiH105dhFd0PX4u48/HF2hSWCdPYt4aBdDxFEjxc=";
      };
    };
  });
  meta = {
    description = "Python API to access the ament resource index.";
  };
})
