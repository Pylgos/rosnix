{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_testing,
  mkSourceSet,
  nav2_behavior_tree,
  nav2_common,
  nav2_costmap_2d,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_core" = substituteSource {
      src = fetchgit {
        name = "nav2_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "2bb7cc18fa14eb0095ac2e25a8cdbb9a4dbe730e";
        hash = "sha256-P8qG5oe8QN9U/X1NAZQNX7Fw/YFAVzUf1tVO9qB3zak=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nav2_core";
  version = "1.3.2-1";
  src = sources."nav2_core";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nav2_behavior_tree nav2_common nav2_costmap_2d nav2_util nav_msgs pluginlib rclcpp rclcpp_lifecycle std_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A set of headers for plugins core to the Nav2 stack";
  };
}
