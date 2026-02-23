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
  pname = "ament_index_python";
  version = "1.8.3-1";
  src = finalAttrs.passthru.sources."ament_index_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_index_python" = substituteSource {
      src = fetchgit {
        name = "ament_index_python-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "3fb7b7ff659d8649f40a787eb9366108b5a497d9";
        hash = "sha256-1fIB7+n2LFQHycJBMNuBDma1ZFI4xBi+1QpPZSR5mkM=";
      };
    };
  });
  meta = {
    description = "\n    Python API to access the ament resource index.\n  ";
  };
})
