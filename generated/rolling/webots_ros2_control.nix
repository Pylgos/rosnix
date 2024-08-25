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
  ros_environment,
  substituteSource,
  webots_ros2_driver,
}:
let
  sources = rec {
    webots_ros2_control = substituteSource {
      src = fetchgit {
        name = "webots_ros2_control-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "66304e27ade0def5e2920c7c5b5017b3653ad863";
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
  src = sources.webots_ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager hardware_interface pluginlib rclcpp rclcpp_lifecycle webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ros2_control plugin for Webots";
  };
}
