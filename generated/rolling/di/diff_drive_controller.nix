{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  geometry_msgs,
  hardware_interface,
  hardware_interface_testing,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rcpputils,
  realtime_tools,
  ros2_control_test_assets,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2_msgs,
}:
let
  sources = rec {
    diff_drive_controller-6e5268983e17c9144c8291b42d8c436c58e6874e = substituteSource {
      src = fetchgit {
        name = "diff_drive_controller-6e5268983e17c9144c8291b42d8c436c58e6874e-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "6e5268983e17c9144c8291b42d8c436c58e6874e";
        hash = "sha256-4PkXN/OSjR1h02SSoSMtv8Up4XTkBPDFzkQpj6ADXME=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diff_drive_controller";
  version = "4.14.0-1";
  src = sources.diff_drive_controller-6e5268983e17c9144c8291b42d8c436c58e6874e;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros controller_interface generate_parameter_library geometry_msgs hardware_interface nav_msgs pluginlib rclcpp rclcpp_lifecycle rcpputils realtime_tools tf2 tf2_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface_testing ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Controller for a differential drive mobile base.";
  };
}
