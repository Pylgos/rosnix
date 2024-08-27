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
  nav2_behavior_tree,
  nav2_core,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  substituteSource,
}:
let
  sources = rec {
    opennav_docking_bt = substituteSource {
      src = fetchgit {
        name = "opennav_docking_bt-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d473e2331ca4a3f91aff8395439a1c9762510ae7";
        hash = "sha256-zz7vLPntojXP52rohjpWXAV4ejYLcQz4xrsHx6hRHic=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "opennav_docking_bt";
  version = "1.3.2-1";
  src = sources.opennav_docking_bt;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ behaviortree_cpp geometry_msgs nav2_behavior_tree nav2_core nav2_msgs nav2_util nav_msgs rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A set of BT nodes and XMLs for docking";
  };
}
