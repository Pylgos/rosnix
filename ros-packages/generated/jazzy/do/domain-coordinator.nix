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
  pname = "domain_coordinator";
  version = "0.12.0-3";
  src = finalAttrs.passthru.sources."domain_coordinator";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "domain_coordinator" = substituteSource {
      src = fetchgit {
        name = "domain_coordinator-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "5e3d0a038b3fb9faa3533271fcecc7c606ad15e5";
        hash = "sha256-pOFTQT4CPWn2FDFTi9cNv54NZ97CMjH/7pOV24uR6Zo=";
      };
    };
  });
  meta = {
    description = "A tool to coordinate unique ROS_DOMAIN_IDs across multiple processes";
  };
})
