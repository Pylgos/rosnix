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
let
  sources = mkSourceSet (sources: {
    "webots_ros2_epuck" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_epuck-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "47f9066772aa1aaaba31885c6d5c2d9f4186e8f6";
        hash = "sha256-Em4RVC4wQa1yoFZKEoSapNa94dL24g4MqYxIRXKc9Ok=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_epuck";
  version = "2023.1.3-1";
  src = finalAttrs.passthru.sources."webots_ros2_epuck";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller geometry-msgs joint-state-broadcaster nav-msgs rclpy robot-state-publisher rviz2 sensor-msgs std-msgs tf2-ros webots-ros2-control webots-ros2-driver webots-ros2-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "E-puck2 driver for Webots simulated robot";
  };
})
