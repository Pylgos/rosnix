{
  buildRosPackage,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcl_interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  rosidl_runtime_py,
  substituteSource,
}:
let
  sources = rec {
    ros2controlcli = substituteSource {
      src = fetchgit {
        name = "ros2controlcli-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "f078f8b8ddd3e6977a15698bc790c6bede9f9438";
        hash = "sha256-mfBqleIbRep9wpiqYBUs+cgKadDJ8tKCtFZsLOTvEzo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2controlcli";
  version = "4.16.0-1";
  src = sources.ros2controlcli;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager controller_manager_msgs python3Packages.pygraphviz rcl_interfaces rclpy ros2cli ros2node ros2param rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ROS 2 command line tools for ROS2 Control.";
  };
}
