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
  version = "2.0.0-2";
  src = finalAttrs.passthru.sources."mouse_teleop";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-tk" ]; };
  propagatedBuildInputs = [ geometry-msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-tk" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "mouse_teleop" = substituteSource {
      src = fetchgit {
        name = "mouse_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "6fa399b4cc7b08cdf60e67e9273481f8a9c8be5b";
        hash = "sha256-SptaOBbmYAwjG3IPGYZv7z3aGbIujCtd98/9NylfMMc=";
      };
    };
  });
  meta = {
    description = "A mouse teleop tool for holonomic mobile robots.";
  };
})
