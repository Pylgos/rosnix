{
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  pname = "key_teleop";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."key_teleop";
  propagatedBuildInputs = [ geometry-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "key_teleop" = substituteSource {
        src = fetchgit {
          name = "key_teleop-source";
          url = "https://github.com/ros2-gbp/teleop_tools-release.git";
          rev = "1e58df485614cc690114ed7e815ef743c73c82f6";
          hash = "sha256-HYIAeTW/FIJtUM3S9a5KIKG5IEhFU64E6fp8ursuQTE=";
        };
      };
    });
  };
  meta = {
    description = "A text-based interface to send a robot movement commands.";
  };
})
