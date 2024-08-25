{
  ament_copyright,
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
    webots_ros2_mavic = substituteSource {
      src = fetchgit {
        name = "webots_ros2_mavic-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "daa14c43a683a5e993102772d85747e67ac53370";
        hash = "sha256-fFjl+kzo8dFp4pJE8dNCeIPEPsjKsD/fBvf49R8oMzQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_mavic";
  version = "2023.1.3-1";
  src = sources.webots_ros2_mavic;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclpy webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Mavic 2 Pro robot ROS2 interface for Webots.";
  };
}
