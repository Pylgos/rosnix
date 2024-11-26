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
  version = "0.13.1-1";
  src = finalAttrs.passthru.sources."domain_coordinator";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "domain_coordinator" = substituteSource {
        src = fetchgit {
          name = "domain_coordinator-source";
          url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
          rev = "b9b28e0dac2b871f436eeacef9e8e1ec43e5e53e";
          hash = "sha256-GGlZLImxCRW1d0aImc2Fb1tH6FlHG5hM7H0NhJvubOw=";
        };
      };
    });
  };
  meta = {
    description = "A tool to coordinate unique ROS_DOMAIN_IDs across multiple processes";
  };
})
