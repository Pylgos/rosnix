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
        rev = "531c39e19ced9c9d1fc7f9708b7d0aa91ad27903";
        hash = "sha256-HMbaIXM4eHC7iq4gPO/DBRlM6zBWUo510ifLC5BZs7s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_graceful_controller";
  version = "1.3.2-1";
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
