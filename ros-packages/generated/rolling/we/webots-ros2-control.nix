{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  webots-ros2-driver,
}:
let
  sources = mkSourceSet (sources: {
    "webots_ros2_control" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_control-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "66304e27ade0def5e2920c7c5b5017b3653ad863";
        hash = "sha256-fz9az02oYBg4yS8uZnrKyD+g2HzUgotsfK7Yhhu2FNE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "webots_ros2_control";
  version = "2023.1.3-1";
  src = sources."webots_ros2_control";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller-manager hardware-interface pluginlib rclcpp rclcpp-lifecycle webots-ros2-driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2_control plugin for Webots";
  };
}
