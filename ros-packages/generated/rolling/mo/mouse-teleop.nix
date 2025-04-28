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
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."mouse_teleop";
  propagatedBuildInputs = [ geometry-msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-tk" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "mouse_teleop" = substituteSource {
      src = fetchgit {
        name = "mouse_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "7f93faae4ed2bb495c1e27ba1b086e2ac686ac6b";
        hash = "sha256-SptaOBbmYAwjG3IPGYZv7z3aGbIujCtd98/9NylfMMc=";
      };
    };
  });
  meta = {
    description = "A mouse teleop tool for holonomic mobile robots.";
  };
})
