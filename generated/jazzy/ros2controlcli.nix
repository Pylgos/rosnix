{
  buildRosPackage,
  controller_manager,
  controller_manager_msgs,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rcl_interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  rosSystemPackages,
  rosidl_runtime_py,
  substituteSource,
}:
let
  sources = rec {
    ros2controlcli = substituteSource {
      src = fetchFromGitHub {
        name = "ros2controlcli-source";
        owner = "ros2-gbp";
        repo = "ros2_control-release";
        rev = "2bbc0e1b4951658b59567c813b2d2a9b752ba24c";
        hash = "sha256-XVuJ+glFnv4GuwLrPQ7lJH9JVg/+ZyFUhaPCZoN3QP0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2controlcli";
  version = "4.17.0-1";
  src = sources.ros2controlcli;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_manager controller_manager_msgs rcl_interfaces rclpy ros2cli ros2node ros2param rosidl_runtime_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ROS 2 command line tools for ROS2 Control.";
  };
}
