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
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."gc_spl";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ gc-spl-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gc_spl" = substituteSource {
      src = fetchgit {
        name = "gc_spl-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "23f6609febe23babb82518905b92e671d55426fb";
        hash = "sha256-kBydHwBx9u24rh4sj6NKKQpUKIbO8g4PI3S6eB29Mz8=";
      };
    };
  });
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
})
