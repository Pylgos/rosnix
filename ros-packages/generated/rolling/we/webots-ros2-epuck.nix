{
  ament-copyright,
  buildAmentPythonPackage,
  builtin-interfaces,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  joint-state-broadcaster,
  mkSourceSet,
  nav-msgs,
  rclpy,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
  webots-ros2-control,
  webots-ros2-driver,
  webots-ros2-msgs,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_epuck";
  version = "2025.0.1-1";
  src = finalAttrs.passthru.sources."webots_ros2_epuck";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller geometry-msgs joint-state-broadcaster nav-msgs rclpy robot-state-publisher rviz2 sensor-msgs std-msgs tf2-ros webots-ros2-control webots-ros2-driver webots-ros2-msgs ];
  propagatedBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller geometry-msgs joint-state-broadcaster nav-msgs rclpy robot-state-publisher rviz2 sensor-msgs std-msgs tf2-ros webots-ros2-control webots-ros2-driver webots-ros2-msgs ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_epuck" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_epuck-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "903ee7e0eaa16086db38e11b46eddee3e4682d2e";
        hash = "sha256-iG9y3izH3Avq+/D2pgM7gWEh6SmhoHHkYg4jlQGFIvo=";
      };
    };
  });
  meta = {
    description = "E-puck2 driver for Webots simulated robot";
  };
})
