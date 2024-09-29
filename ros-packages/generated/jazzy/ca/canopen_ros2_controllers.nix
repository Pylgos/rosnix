{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  canopen_402_driver,
  canopen_interfaces,
  canopen_proxy_driver,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  rosSystemPackages,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "canopen_ros2_controllers" = substituteSource {
      src = fetchgit {
        name = "canopen_ros2_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "c38699e89e1eab1a0d1984daf277c82f7e7a0a12";
        hash = "sha256-koxHonzCdViHXf1kTwf19nMEa8F/YF+ILwVF5p+Muhw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "canopen_ros2_controllers";
  version = "0.2.9-2";
  src = sources."canopen_ros2_controllers";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ canopen_402_driver canopen_interfaces canopen_proxy_driver controller_interface controller_manager hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2_control controllers for ros2_canopen functionalities";
  };
}