{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  ros_environment,
  substituteSource,
  webots_ros2_driver,
}:
let
  sources = rec {
    webots_ros2_control-9fc07c4df14c4f264c39f65cf8921de65b7ccb04 = substituteSource {
      src = fetchgit {
        name = "webots_ros2_control-9fc07c4df14c4f264c39f65cf8921de65b7ccb04-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "9fc07c4df14c4f264c39f65cf8921de65b7ccb04";
        hash = "sha256-fz9az02oYBg4yS8uZnrKyD+g2HzUgotsfK7Yhhu2FNE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_control";
  version = "2023.1.3-1";
  src = sources.webots_ros2_control-9fc07c4df14c4f264c39f65cf8921de65b7ccb04;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_manager hardware_interface pluginlib rclcpp rclcpp_lifecycle webots_ros2_driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2_control plugin for Webots";
  };
}
