{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grbl_msgs,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    grbl_ros = substituteSource {
      src = fetchgit {
        name = "grbl_ros-source";
        url = "https://github.com/ros2-gbp/grbl_ros-release.git";
        rev = "5799fb212d9171d9944488a5c871f2574b7d5ffb";
        hash = "sha256-F1t2vcBH6JU+xByKp5lu3SCks+qWKp4ztQ5WkL6N+rI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grbl_ros";
  version = "0.0.16-7";
  src = sources.grbl_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grbl_msgs python3Packages.pyserial rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 package to interface with a GRBL serial device";
  };
}
