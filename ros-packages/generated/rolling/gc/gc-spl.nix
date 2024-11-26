{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gc-spl-interfaces,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "gc_spl";
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."gc_spl";
  propagatedBuildInputs = [ gc-spl-interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "gc_spl" = substituteSource {
        src = fetchgit {
          name = "gc_spl-source";
          url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
          rev = "7db7532c5833d2fd25edbad3bf25ebcf77a64a45";
          hash = "sha256-kZmdkalxnRdGGdrKhvxICSX3XNubLGW9lgzSf1zTjys=";
        };
      };
    });
  };
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
})
