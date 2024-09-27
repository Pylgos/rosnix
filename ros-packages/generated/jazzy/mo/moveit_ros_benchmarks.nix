{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_param_builder,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_ros_planning,
  moveit_ros_warehouse,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2_eigen,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_benchmarks-93bf8852d4435dfccab9055a267af6c5111f9934 = substituteSource {
      src = fetchgit {
        name = "moveit_ros_benchmarks-93bf8852d4435dfccab9055a267af6c5111f9934-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "93bf8852d4435dfccab9055a267af6c5111f9934";
        hash = "sha256-sHVNAk/cZy7UtZldddJLN7kWaaakA6FCskuG1egghKU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_benchmarks";
  version = "2.10.0-1";
  src = sources.moveit_ros_benchmarks-93bf8852d4435dfccab9055a267af6c5111f9934;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch_param_builder moveit_common moveit_configs_utils moveit_core moveit_ros_planning moveit_ros_warehouse pluginlib rclcpp tf2_eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-date-time" "libboost-date-time-dev" "libboost-dev" "libboost-filesystem" "libboost-filesystem-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Enhanced tools for benchmarks in MoveIt";
  };
}
