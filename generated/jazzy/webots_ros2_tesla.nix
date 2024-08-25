{
  ackermann_msgs,
  ament_copyright,
  buildPackages,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
  webots_ros2_driver,
}:
let
  sources = rec {
    webots_ros2_tesla = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tesla-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "d233344bc73905dd94849ea6965b8fbaccdf5136";
        hash = "sha256-EgiN0ZldemtOfOdvupDqu2SL+ieC5jRLvULy0+7ejsU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_tesla";
  version = "2023.1.3-1";
  src = sources.webots_ros2_tesla;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ackermann_msgs builtin_interfaces python3Packages.opencv4 rclpy webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Tesla ROS2 interface for Webots.";
  };
}
