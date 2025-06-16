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
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_python" = substituteSource {
      src = fetchgit {
        name = "rtabmap_python-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "2a42d6cbf6d11ba79686826419afffab3a3da9d9";
        hash = "sha256-T/LGnpL0A/ZVikRwA69MjmfL74jW2YypK8/GsrIBEtk=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's python package.";
  };
})
