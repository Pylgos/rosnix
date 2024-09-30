{
  ament-copyright,
  buildRosPackage,
  builtin-interfaces,
  control-msgs,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  joint-trajectory-controller,
  mkSourceSet,
  rclpy,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  trajectory-msgs,
  webots-ros2-control,
  webots-ros2-driver,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "webots_ros2_universal_robot" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_universal_robot-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "9306333154cc8e532e6b777b38260c95868bc03c";
        hash = "sha256-sr/NzavBNSysD8uGaVJAkkImtUr7YgJ0R89t3yILp20=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "webots_ros2_universal_robot";
  version = "2023.1.3-1";
  src = sources."webots_ros2_universal_robot";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces control-msgs controller-manager joint-state-broadcaster joint-trajectory-controller rclpy robot-state-publisher rviz2 trajectory-msgs webots-ros2-control webots-ros2-driver xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Universal Robot ROS2 interface for Webots.";
  };
}
