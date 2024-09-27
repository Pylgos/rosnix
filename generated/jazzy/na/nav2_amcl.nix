{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_ros,
  launch_testing,
  message_filters,
  nav2_common,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    nav2_amcl-eb8e521784d20f21b4b1b082a787d62f135dbb58 = substituteSource {
      src = fetchgit {
        name = "nav2_amcl-eb8e521784d20f21b4b1b082a787d62f135dbb58-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "eb8e521784d20f21b4b1b082a787d62f135dbb58";
        hash = "sha256-ftBsEeUAubF+P6qFhfqYx7vf2WJBYybtUJG3mKFM1xE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_amcl";
  version = "1.3.2-1";
  src = sources.nav2_amcl-eb8e521784d20f21b4b1b082a787d62f135dbb58;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs launch_ros launch_testing message_filters nav2_common nav2_msgs nav2_util nav_msgs pluginlib rclcpp sensor_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "";
  };
}
