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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2";
  version = "2025.0.1-2";
  src = finalAttrs.passthru.sources."webots_ros2";
  propagatedNativeBuildInputs = [ builtin-interfaces rclpy std-msgs webots-ros2-control webots-ros2-crazyflie webots-ros2-driver webots-ros2-epuck webots-ros2-husarion webots-ros2-importer webots-ros2-mavic webots-ros2-msgs webots-ros2-tesla webots-ros2-tiago webots-ros2-turtlebot webots-ros2-universal-robot ];
  propagatedBuildInputs = [ builtin-interfaces rclpy std-msgs webots-ros2-control webots-ros2-crazyflie webots-ros2-driver webots-ros2-epuck webots-ros2-husarion webots-ros2-importer webots-ros2-mavic webots-ros2-msgs webots-ros2-tesla webots-ros2-tiago webots-ros2-turtlebot webots-ros2-universal-robot ];
  checkInputs = [ ament-copyright webots-ros2-tests ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2" = substituteSource {
      src = fetchgit {
        name = "webots_ros2-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "2150d55a72ffb54badfcf0426f23fd54b5ea5871";
        hash = "sha256-0r2z0CWkkaVunVFFFGmY65gV7R2VzMxulVRQuyo/X/c=";
      };
    };
  });
  meta = {
    description = "Interface between Webots and ROS2";
  };
})
