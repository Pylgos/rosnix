{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_controller,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    nav2_graceful_controller = substituteSource {
      src = fetchgit {
        name = "nav2_graceful_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "ff3bc6357733887e0d7cec0f4da95f505c9e9a01";
        hash = "sha256-EySxARKMADE8RVp5WMIQ0B/7YLTE3ZijVWs5Tj/MLoY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_graceful_controller";
  version = "1.3.1-1";
  src = sources.nav2_graceful_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_2d_utils pluginlib rclcpp tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common nav2_controller ];
  missingDependencies = [  ];
  meta = {
    description = "Graceful motion controller";
  };
}
