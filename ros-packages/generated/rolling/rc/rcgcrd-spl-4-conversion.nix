{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcgcrd-spl-4,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rcgcrd_spl_4_conversion";
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."rcgcrd_spl_4_conversion";
  propagatedBuildInputs = [ rcgcrd-spl-4 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rcgcrd_spl_4_conversion" = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4_conversion-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "e8f9b909d0d6f31357299651b044ad6d3751126f";
        hash = "sha256-K6SsOmDF2Dk83+uU8ncpvCemrAtVafqT2p8nJLEgu44=";
      };
    };
  });
  meta = {
    description = "Converts RoboCup SPL GameController Return Data V4 between ROS msg and UDP raw bytes";
  };
})
