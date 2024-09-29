{
  ament_cmake,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "moveit_simple_controller_manager" = substituteSource {
      src = fetchgit {
        name = "moveit_simple_controller_manager-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "876f7bb5cef97fc88176ae77dd1015afb7a50fdb";
        hash = "sha256-phTAY2teeJGDQBTJPZ/T6NS6p89dX8IaJixBCe745ew=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_simple_controller_manager";
  version = "2.10.0-1";
  src = sources."moveit_simple_controller_manager";
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