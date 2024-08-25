{
  ament_cmake,
  ament_cmake_gen_version_h,
  ament_cmake_gmock,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_index_cpp,
  backward_ros,
  buildRosPackage,
  controller_interface,
  controller_manager_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  hardware_interface_testing,
  launch,
  launch_ros,
  pluginlib,
  rclcpp,
  rcpputils,
  realtime_tools,
  ros2_control_test_assets,
  ros2param,
  ros2run,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    controller_manager = substituteSource {
      src = fetchgit {
        name = "controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "34d38d0e2b0892ddd5be76830804e81f206e038b";
        hash = "sha256-YnGsv2oOZYkC48qXkc7OXjyP/t8+X0bsJxi1rUd6oxs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_manager";
  version = "4.15.0-1";
  src = sources.controller_manager;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp backward_ros controller_interface controller_manager_msgs diagnostic_updater hardware_interface launch launch_ros pluginlib rclcpp rcpputils realtime_tools ros2_control_test_assets ros2param ros2run std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_pytest hardware_interface_testing ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "Description of controller_manager";
  };
}
