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
        rev = "920e17e4d38efca9a8fbc4952b855329b5c7dc90";
        hash = "sha256-CEnfVPi1CXKkJd41iBsJmHPwREpT0tSHXFUPerJIH2Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_hardware";
  version = "0.6.0-1";
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
