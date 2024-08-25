{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  ceres-solver,
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
  substituteSource,
}:
let
  sources = rec {
    nav2_constrained_smoother = substituteSource {
      src = fetchgit {
        name = "nav2_constrained_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "7270db9bb8f83f315c5df6458f537fae04ed73a2";
        hash = "sha256-tdO/A5FNAqSUWaphD+iSywKrVZCYoOKCdt+ucqy9wbY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_constrained_smoother";
  version = "1.3.1-1";
  src = sources.nav2_constrained_smoother;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles ceres-solver nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Ceres constrained smoother";
  };
}
