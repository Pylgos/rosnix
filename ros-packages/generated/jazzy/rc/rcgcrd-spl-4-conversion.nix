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
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."rcgcrd_spl_4_conversion";
  propagatedBuildInputs = [ rcgcrd-spl-4 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rcgcrd_spl_4_conversion" = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4_conversion-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "1dd683266a3b53ec7f5f194507459e57d04a35e7";
        hash = "sha256-A8O2E8T8ieEi2ljnmhInwsVAbmTUWBTg9nqvfVmFKso=";
      };
    };
  });
  meta = {
    description = "Converts RoboCup SPL GameController Return Data V4 between ROS msg and UDP raw bytes";
  };
})
