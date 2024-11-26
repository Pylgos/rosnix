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
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."rcgcd_spl_14_conversion";
  propagatedBuildInputs = [ rcgcd-spl-14 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rcgcd_spl_14_conversion" = substituteSource {
        src = fetchgit {
          name = "rcgcd_spl_14_conversion-source";
          url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
          rev = "3e096ab300261358e66d1874b3c3ba8fb01cca88";
          hash = "sha256-vEiB03hHosdjl+RcKMvGYxd7RnFNFQcB7pEearKQX0s=";
        };
      };
    });
  };
  meta = {
    description = "Converts RoboCup SPL GameController Data V14 between ROS msg and UDP raw bytes";
  };
})
