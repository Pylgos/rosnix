{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  behaviortree_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  nav2_behavior_tree,
  nav2_core,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "opennav_docking_bt" = substituteSource {
      src = fetchgit {
        name = "opennav_docking_bt-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d473e2331ca4a3f91aff8395439a1c9762510ae7";
        hash = "sha256-zz7vLPntojXP52rohjpWXAV4ejYLcQz4xrsHx6hRHic=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "opennav_docking_bt";
  version = "1.3.2-1";
  src = sources."opennav_docking_bt";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ behaviortree_cpp geometry_msgs nav2_behavior_tree nav2_core nav2_msgs nav2_util nav_msgs rclcpp rclcpp_action ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A set of BT nodes and XMLs for docking";
  };
}
