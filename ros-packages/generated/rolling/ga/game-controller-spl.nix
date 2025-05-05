{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  game-controller-spl-interfaces,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "game_controller_spl";
  version = "5.0.0-2";
  src = finalAttrs.passthru.sources."game_controller_spl";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ game-controller-spl-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "game_controller_spl" = substituteSource {
      src = fetchgit {
        name = "game_controller_spl-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "b6c2fb3c8281f4c9198143f76fa09ca7bc6d16db";
        hash = "sha256-RPU0suzS2uUV5FPh8HLJ4g/GiyJDnWUIVL9NmJ+7U1U=";
      };
    };
  });
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
})
