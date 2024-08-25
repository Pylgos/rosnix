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
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    nav2_regulated_pure_pursuit_controller = substituteSource {
      src = fetchgit {
        name = "nav2_regulated_pure_pursuit_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "cafd073c2a40aa54455b495c85fb6bf0a77ea3a1";
        hash = "sha256-OmE1Hqvqv/GJX2yK+Vr+e07Gc5e4II+zQnJyvkJOc6A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_regulated_pure_pursuit_controller";
  version = "1.3.1-1";
  src = sources.nav2_regulated_pure_pursuit_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Regulated Pure Pursuit Controller";
  };
}
