{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  splsm-7-conversion,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "r2r_spl_7";
  version = "3.0.1-3";
  src = finalAttrs.passthru.sources."r2r_spl_7";
  propagatedBuildInputs = [ rclpy splsm-7-conversion ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "r2r_spl_7" = substituteSource {
        src = fetchgit {
          name = "r2r_spl_7-source";
          url = "https://github.com/ros2-gbp/r2r_spl-release.git";
          rev = "bd2a8f4d52d998f101dfb33be38a6b6b4154ee28";
          hash = "sha256-KqN+JK6GIZritk8/5cBigl1cu2sdMFz9nP3mrSQOsro=";
        };
      };
    });
  };
  meta = {
    description = "Robot-To-Robot communication in RoboCup SPL using SPLSM V7";
  };
})
