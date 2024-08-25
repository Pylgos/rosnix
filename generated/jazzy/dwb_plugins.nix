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
        rev = "00c0130b490628983cf57d9b08fee4d3347630a2";
        hash = "sha256-DtmHY0SViAnvfz/MA9j4UOQ5bKI8JaRPmy4Ur2BDwi4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_plugins";
  version = "1.3.1-1";
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
