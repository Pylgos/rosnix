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
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."game_controller_spl";
  propagatedBuildInputs = [ game-controller-spl-interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "game_controller_spl" = substituteSource {
        src = fetchgit {
          name = "game_controller_spl-source";
          url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
          rev = "0df9a750b7eb24371f5f828dd89cf6472e5bfc7f";
          hash = "sha256-FvjsH3PKrQtxsZS4hXMelGbnTjvs6W2JjiYn6WevoWA=";
        };
      };
    });
  };
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
})
