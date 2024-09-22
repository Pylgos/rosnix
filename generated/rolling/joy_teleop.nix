{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  control_msgs,
  example_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_ros,
  launch_testing,
  rclpy,
  rosSystemPackages,
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
      src = fetchFromGitHub {
        name = "joy_teleop-source";
        owner = "ros2-gbp";
        repo = "teleop_tools-release";
        rev = "4117d2e06a4292a97ed80671e9908600d8a019bd";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control_msgs rclpy rosidl_runtime_py sensor_msgs teleop_tools_msgs trajectory_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint example_interfaces geometry_msgs launch_ros launch_testing std_msgs std_srvs test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A (to be) generic joystick interface to control a robot";
  };
}
