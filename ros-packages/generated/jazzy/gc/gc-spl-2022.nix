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
  rcgcd-spl-14-conversion,
  rcgcrd-spl-4,
  rcgcrd-spl-4-conversion,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "gc_spl_2022";
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."gc_spl_2022";
  propagatedNativeBuildInputs = [ rcgcd-spl-14 rcgcd-spl-14-conversion rcgcrd-spl-4 rcgcrd-spl-4-conversion rclpy ];
  propagatedBuildInputs = [ rcgcd-spl-14 rcgcd-spl-14-conversion rcgcrd-spl-4 rcgcrd-spl-4-conversion rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gc_spl_2022" = substituteSource {
      src = fetchgit {
        name = "gc_spl_2022-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "b03808fb65315eadfa5340a4e3d75642efd8e338";
        hash = "sha256-btNg1LcczyCRoT2UUOwi1sXMkCNMpol5muaMR0UqAzA=";
      };
    };
  });
  meta = {
    description = "GameController-Robot communication in RoboCup SPL at RoboCup2022";
  };
})
