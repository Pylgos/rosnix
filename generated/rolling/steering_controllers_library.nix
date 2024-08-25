{
  ackermann_msgs,
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  control_msgs,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  geometry_msgs,
  hardware_interface,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rcpputils,
  realtime_tools,
  ros2_control_test_assets,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_msgs,
}:
let
  sources = rec {
    steering_controllers_library = substituteSource {
      src = fetchgit {
        name = "steering_controllers_library-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "5d67d51b0c2eb4db791d03aa92f2c53323e9e2bc";
        hash = "sha256-ttGQrEkRAt1YejbYGg/9iGlFzUu3Rd2WMwteQ61PcSw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "steering_controllers_library";
  version = "4.13.0-1";
  src = sources.steering_controllers_library;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ackermann_msgs backward_ros control_msgs controller_interface generate_parameter_library geometry_msgs hardware_interface nav_msgs pluginlib rclcpp rclcpp_lifecycle rcpputils realtime_tools std_srvs tf2 tf2_geometry_msgs tf2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock controller_manager ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "Package for steering robot configurations including odometry and interfaces.";
  };
}
