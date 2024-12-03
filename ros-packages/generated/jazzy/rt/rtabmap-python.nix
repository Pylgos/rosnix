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
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_python" = substituteSource {
      src = fetchgit {
        name = "rtabmap_python-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "bf42a9777e56f09e02c61d502ff6f32c7df81b6c";
        hash = "sha256-R2rZm2P7IupNEp7FhHBLae2FYVMw4kXZQb5JagpxKKg=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's python package.";
  };
})
