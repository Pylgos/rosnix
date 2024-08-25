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
        rev = "99fe7fdca551e61e217e9d3d8917d3c5785ee0fa";
        hash = "sha256-hw5Sl6ChaS9p+V0BFp6Qie/L4a4sh1LmTdZeAswlTtU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2controlcli";
  version = "4.15.0-1";
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
