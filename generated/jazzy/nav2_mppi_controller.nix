{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gbenchmark,
  geometry_msgs,
  llvmPackages,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_mppi_controller = substituteSource {
      src = fetchgit {
        name = "nav2_mppi_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "74ed9a89f935c9afa4ea238ef38ebf71623fe51c";
        hash = "sha256-5xmU1ga1kmDi1fb+prFHI/tWdCmRECFxlSW/ao+XktQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_mppi_controller";
  version = "1.3.1-1";
  src = sources.nav2_mppi_controller;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [ gbenchmark ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs llvmPackages.openmp nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [ "xsimd" "xtensor" ];
  meta = {
    description = "nav2_mppi_controller";
  };
}
