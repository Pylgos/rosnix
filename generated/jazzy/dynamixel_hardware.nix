{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dynamixel_workbench_toolbox,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  lifecycle_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    dynamixel_hardware = substituteSource {
      src = fetchgit {
        name = "dynamixel_hardware-source";
        url = "https://github.com/ros2-gbp/dynamixel_hardware-release.git";
        rev = "9e93cb35756ed7c16e03ad98297796433a909558";
        hash = "sha256-deu91vC3s0Ae1J44bHU0xIFpjV6bJ0q40HfourfwdvQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_hardware";
  version = "0.5.0-1";
  src = sources.dynamixel_hardware;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_workbench_toolbox hardware_interface lifecycle_msgs pluginlib rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ros2_control hardware for ROBOTIS Dynamixel";
  };
}
