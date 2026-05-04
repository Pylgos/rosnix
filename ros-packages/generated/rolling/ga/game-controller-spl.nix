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
  version = "5.0.0-3";
  src = finalAttrs.passthru.sources."game_controller_spl";
  propagatedNativeBuildInputs = [ game-controller-spl-interfaces rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-construct" ]; };
  propagatedBuildInputs = [ game-controller-spl-interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "game_controller_spl" = substituteSource {
      src = fetchgit {
        name = "game_controller_spl-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "56809fddefea58ac284b9ef1c701472aa9161775";
        hash = "sha256-RPU0suzS2uUV5FPh8HLJ4g/GiyJDnWUIVL9NmJ+7U1U=";
      };
    };
  });
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
})
