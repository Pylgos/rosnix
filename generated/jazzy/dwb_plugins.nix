{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  dwb_core,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    dwb_plugins = substituteSource {
      src = fetchgit {
        name = "dwb_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles dwb_core nav2_common nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Standard implementations of the GoalChecker and TrajectoryGenerators for dwb_core";
  };
}
