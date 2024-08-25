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
  nav2_regulated_pure_pursuit_controller,
  nav2_util,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    nav2_rotation_shim_controller = substituteSource {
      src = fetchgit {
        name = "nav2_rotation_shim_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a122f5212dfbf5879e912aaa53793eba2f50f4e9";
        hash = "sha256-7FJxjZRToVV8XqqM+WfgTbjVB50roNHOfvsv20p8REc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_rotation_shim_controller";
  version = "1.3.1-1";
  src = sources.nav2_rotation_shim_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common nav2_controller nav2_regulated_pure_pursuit_controller ];
  missingDependencies = [  ];
  meta = {
    description = "Rotation Shim Controller";
  };
}
