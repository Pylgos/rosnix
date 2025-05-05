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
  webots-ros2-crazyflie,
  webots-ros2-driver,
  webots-ros2-epuck,
  webots-ros2-husarion,
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
  version = "2025.0.0-1";
  src = finalAttrs.passthru.sources."webots_ros2";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ builtin-interfaces std-msgs webots-ros2-control webots-ros2-crazyflie webots-ros2-driver webots-ros2-epuck webots-ros2-husarion webots-ros2-importer webots-ros2-mavic webots-ros2-msgs webots-ros2-tesla webots-ros2-tiago webots-ros2-turtlebot webots-ros2-universal-robot ];
  checkInputs = [ ament-copyright webots-ros2-tests ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2" = substituteSource {
      src = fetchgit {
        name = "webots_ros2-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "8a4e2263f62f6825fc4d3ef40d87c4e0057dd865";
        hash = "sha256-aJHm0jqKqEj9nqFCuSAO8dF2XFoWwxv9BlUlqlffZe8=";
      };
    };
  });
  meta = {
    description = "Interface between Webots and ROS2";
  };
})
