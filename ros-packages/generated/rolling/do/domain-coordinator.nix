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
  pname = "domain_coordinator";
  version = "0.15.0-1";
  src = finalAttrs.passthru.sources."domain_coordinator";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "domain_coordinator" = substituteSource {
      src = fetchgit {
        name = "domain_coordinator-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "e1f88ade3a0e58e16fde040670fcef978d871aaa";
        hash = "sha256-O3ZQ7o6DIsW+q8fEsEtH0KCfZxm8noc+yRKs1xsbQRk=";
      };
    };
  });
  meta = {
    description = "A tool to coordinate unique ROS_DOMAIN_IDs across multiple processes";
  };
})
