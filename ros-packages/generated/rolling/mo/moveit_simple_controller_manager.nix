{
  ament_cmake,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_simple_controller_manager-df0380762006721e66a18b73c73cd5bdffb865f9 = substituteSource {
      src = fetchgit {
        name = "moveit_simple_controller_manager-df0380762006721e66a18b73c73cd5bdffb865f9-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "df0380762006721e66a18b73c73cd5bdffb865f9";
        hash = "sha256-xvhdxCOyAp11mJMkCm+Bez2/3z8XBGKmgo7ZGUuO44Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_simple_controller_manager";
  version = "2.11.0-1";
  src = sources.moveit_simple_controller_manager-df0380762006721e66a18b73c73cd5bdffb865f9;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control_msgs moveit_common moveit_core pluginlib rclcpp rclcpp_action ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A generic, simple controller manager plugin for MoveIt.";
  };
}
