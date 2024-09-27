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
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "dynamixel_hardware" = substituteSource {
      src = fetchgit {
        name = "dynamixel_hardware-source";
        url = "https://github.com/ros2-gbp/dynamixel_hardware-release.git";
        rev = "9e93cb35756ed7c16e03ad98297796433a909558";
        hash = "sha256-deu91vC3s0Ae1J44bHU0xIFpjV6bJ0q40HfourfwdvQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "dynamixel_hardware";
  version = "0.5.0-1";
  src = sources."dynamixel_hardware";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ dynamixel_workbench_toolbox hardware_interface lifecycle_msgs pluginlib rclcpp rclcpp_lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2_control hardware for ROBOTIS Dynamixel";
  };
}
