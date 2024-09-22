{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    nav2_theta_star_planner = substituteSource {
      src = fetchgit {
        name = "nav2_theta_star_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "e36d6e0da50f7626d260f756dbfe141ed990c020";
        hash = "sha256-Nr2c+669UgvzGc55Tz1013vuzVVZAiOI6lKDv6g2Sww=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_theta_star_planner";
  version = "1.3.2-1";
  src = sources.nav2_theta_star_planner;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Theta* Global Planning Plugin";
  };
}
