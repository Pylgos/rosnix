{
  ament-copyright,
  buildAmentPythonPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  webots-ros2-control,
  webots-ros2-driver,
  webots-ros2-epuck,
  webots-ros2-importer,
  webots-ros2-mavic,
  webots-ros2-msgs,
  webots-ros2-tesla,
  webots-ros2-tests,
  webots-ros2-tiago,
  webots-ros2-turtlebot,
  webots-ros2-universal-robot,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2";
  version = "2023.1.3-1";
  src = finalAttrs.passthru.sources."webots_ros2";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ builtin-interfaces rclpy std-msgs webots-ros2-control webots-ros2-driver webots-ros2-epuck webots-ros2-importer webots-ros2-mavic webots-ros2-msgs webots-ros2-tesla webots-ros2-tiago webots-ros2-turtlebot webots-ros2-universal-robot ];
  checkInputs = [ ament-copyright webots-ros2-tests ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2" = substituteSource {
      src = fetchgit {
        name = "webots_ros2-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "b5cbb4019807e11cffbc8761f4c673eece53e72d";
        hash = "sha256-MU8z5pasd46CfN/dGIGVbDVgC6W0iUUPh9lf0TeCFUQ=";
      };
    };
  });
  meta = {
    description = "Interface between Webots and ROS2";
  };
})
