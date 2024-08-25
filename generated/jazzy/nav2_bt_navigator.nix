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
  nav2_common,
  nav2_core,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    nav2_bt_navigator = substituteSource {
      src = fetchgit {
        name = "nav2_bt_navigator-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "8eb83286cc88a4e598cc9ebee20896a805fc017e";
        hash = "sha256-zy0VHxzPhaqY6m22thgM9NkB/wK8rTqqLV7Mzr040Yg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_bt_navigator";
  version = "1.3.1-1";
  src = sources.nav2_bt_navigator;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ behaviortree_cpp geometry_msgs nav2_behavior_tree nav2_common nav2_core nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle std_msgs std_srvs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Nav2 BT Navigator Server";
  };
}
