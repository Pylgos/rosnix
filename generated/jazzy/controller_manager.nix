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
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    controller_manager = substituteSource {
      src = fetchgit {
        name = "controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "7fc492da65daaa9af68a50a09ca41113f13c2977";
        hash = "sha256-AURhVjjIW1iQszNXkH6YWyBbn+/6a3A8KUNIVE8fiDA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_manager";
  version = "4.17.0-1";
  src = sources.controller_manager;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp backward_ros controller_interface controller_manager_msgs diagnostic_updater hardware_interface launch launch_ros pluginlib rclcpp rcpputils realtime_tools ros2_control_test_assets ros2param ros2run std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_pytest hardware_interface_testing ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-coverage" ]; };
  meta = {
    description = "Description of controller_manager";
  };
}
