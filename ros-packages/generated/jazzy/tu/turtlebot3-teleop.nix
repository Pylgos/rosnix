{
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
  pname = "turtlebot3_teleop";
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."turtlebot3_teleop";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy ];
  propagatedBuildInputs = [ geometry-msgs rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_teleop" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_teleop-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "1ca67224f714c66a34cc4070019c94f4e380cc18";
        hash = "sha256-wZWlG6OqaUsBuucDGZ0G9kse9bHfS21pVXspj9q6wMk=";
      };
    };
  });
  meta = {
    description = "\n    Teleoperation node using keyboard for TurtleBot3.\n  ";
  };
})
