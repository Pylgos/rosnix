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
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."key_teleop";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy ];
  propagatedBuildInputs = [ geometry-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "key_teleop" = substituteSource {
      src = fetchgit {
        name = "key_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "28a437d2f04309e5b45315dd71ae807772410b1b";
        hash = "sha256-rVwNE9lEp06xwSZ395zyJ+rs9SQd7+ChbwWtrUQ6ogo=";
      };
    };
  });
  meta = {
    description = "A text-based interface to send a robot movement commands.";
  };
})
