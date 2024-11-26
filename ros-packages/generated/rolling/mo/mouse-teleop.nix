{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "mouse_teleop";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."mouse_teleop";
  propagatedBuildInputs = [ geometry-msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-tk" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "mouse_teleop" = substituteSource {
      src = fetchgit {
        name = "mouse_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "f412bd1b699063e52c8b9a3db16763623b7044c0";
        hash = "sha256-aOP48rfspGDsSFU8rwhF9mhTNccMC5JOa1mWtpW08cQ=";
      };
    };
  });
  meta = {
    description = "A mouse teleop tool for holonomic mobile robots.";
  };
})
