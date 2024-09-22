{
  ament_cmake,
  buildRosPackage,
  chomp_motion_planner,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_planners_chomp = substituteSource {
      src = fetchgit {
        name = "moveit_planners_chomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "21ee9a088ae8b104c1719b7e15353681ba2ee853";
        hash = "sha256-W8GhBQYkvLZ6DKk+pkVc/ZwnfNVRwIcTqlqWHX3sHSE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners_chomp";
  version = "2.10.0-1";
  src = sources.moveit_planners_chomp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ chomp_motion_planner moveit_common moveit_core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The interface for using CHOMP within MoveIt";
  };
}
