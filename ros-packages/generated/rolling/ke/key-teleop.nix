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
  propagatedBuildInputs = [ geometry-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "key_teleop" = substituteSource {
      src = fetchgit {
        name = "key_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "6b0294992fe6561477994416340ff11b88ebe777";
        hash = "sha256-rVwNE9lEp06xwSZ395zyJ+rs9SQd7+ChbwWtrUQ6ogo=";
      };
    };
  });
  meta = {
    description = "A text-based interface to send a robot movement commands.";
  };
})
