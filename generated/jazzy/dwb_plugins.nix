{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  dwb_core,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    dwb_plugins = substituteSource {
      src = fetchFromGitHub {
        name = "dwb_plugins-source";
        owner = "SteveMacenski";
        repo = "navigation2-release";
        rev = "b30a9ef44cf345835dc994d94a6df82cc7439ed7";
        hash = "sha256-RM7pUx4Bq3yI4WTEzl5Oojr+pNEFNrtZgbT/coSKby0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_plugins";
  version = "1.3.2-1";
  src = sources.dwb_plugins;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles dwb_core nav2_common nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Standard implementations of the GoalChecker and TrajectoryGenerators for dwb_core";
  };
}
