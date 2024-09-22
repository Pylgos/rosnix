{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_planner = substituteSource {
      src = fetchgit {
        name = "nav2_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "cb726be9f8acd898060e9738e61f5f3f94b97a4f";
        hash = "sha256-zz9HBiZwXL3UR3UHMvZaDOhWIgqjqs4bcVHy1/if6xs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_planner";
  version = "1.3.2-1";
  src = sources.nav2_planner;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nav2 planner server package";
  };
}
