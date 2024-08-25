{
  ament_copyright,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
  webots_ros2_control,
  webots_ros2_driver,
  webots_ros2_epuck,
  webots_ros2_importer,
  webots_ros2_mavic,
  webots_ros2_msgs,
  webots_ros2_tesla,
  webots_ros2_tests,
  webots_ros2_tiago,
  webots_ros2_turtlebot,
  webots_ros2_universal_robot,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    webots_ros2 = substituteSource {
      src = fetchgit {
        name = "webots_ros2-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "b5cbb4019807e11cffbc8761f4c673eece53e72d";
        hash = "sha256-MU8z5pasd46CfN/dGIGVbDVgC6W0iUUPh9lf0TeCFUQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2";
  version = "2023.1.3-1";
  src = sources.webots_ros2;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclpy std_msgs webots_ros2_control webots_ros2_driver webots_ros2_epuck webots_ros2_importer webots_ros2_mavic webots_ros2_msgs webots_ros2_tesla webots_ros2_tiago webots_ros2_turtlebot webots_ros2_universal_robot ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest webots_ros2_tests ];
  missingDependencies = [  ];
  meta = {
    description = "Interface between Webots and ROS2";
  };
}
