{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  control_msgs,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_ros,
  launch_testing,
  rclpy,
  rosidl_runtime_py,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  teleop_tools_msgs,
  test_msgs,
  trajectory_msgs,
}:
let
  sources = rec {
    joy_teleop = substituteSource {
      src = fetchgit {
        name = "joy_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "e949663f15f31403152dd8617d3cea16d9b4a00a";
        hash = "sha256-upObp0jfQf198ZPg1eoz2Yg0HPhYRD2GGmIAowZS+ow=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joy_teleop";
  version = "1.5.1-1";
  src = sources.joy_teleop;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs rclpy rosidl_runtime_py sensor_msgs teleop_tools_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint example_interfaces geometry_msgs launch_ros launch_testing std_msgs std_srvs test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "A (to be) generic joystick interface to control a robot";
  };
}
