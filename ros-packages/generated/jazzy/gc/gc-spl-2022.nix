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
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."gc_spl_2022";
  propagatedBuildInputs = [ rcgcd-spl-14 rcgcd-spl-14-conversion rcgcrd-spl-4 rcgcrd-spl-4-conversion rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gc_spl_2022" = substituteSource {
      src = fetchgit {
        name = "gc_spl_2022-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "614c89da758766a75b5428d8572d113dab487143";
        hash = "sha256-TfjfnmIcrHDLljR0mc7TbRI7pB8FeP3JFv1Jf6C9zpM=";
      };
    };
  });
  meta = {
    description = "GameController-Robot communication in RoboCup SPL at RoboCup2022";
  };
})
