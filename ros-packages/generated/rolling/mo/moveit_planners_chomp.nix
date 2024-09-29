{
  ament_cmake,
  buildRosPackage,
  chomp_motion_planner,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit_common,
  moveit_core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_planners_chomp" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_chomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "d499cf80912afe985d5e76c20cfb7318c163d0d8";
        hash = "sha256-odJd3LUSg00fK5t+Fkk91dY+x9QFsjWqvPZ/t5E8uao=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_planners_chomp";
  version = "2.11.0-1";
  src = sources."moveit_planners_chomp";
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