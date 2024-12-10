{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcgcd-spl-14,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rcgcd_spl_14_conversion";
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."rcgcd_spl_14_conversion";
  propagatedBuildInputs = [ rcgcd-spl-14 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rcgcd_spl_14_conversion" = substituteSource {
      src = fetchgit {
        name = "rcgcd_spl_14_conversion-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "69edd75d56507f3554c25f2937f9a0acbc0343d4";
        hash = "sha256-HpeS37dlNEkrV8sJxN0hI8AsN29MaW9tSC5ywm/BUkM=";
      };
    };
  });
  meta = {
    description = "Converts RoboCup SPL GameController Data V14 between ROS msg and UDP raw bytes";
  };
})
