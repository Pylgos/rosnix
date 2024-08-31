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
  xsimd,
  xtensor,
}:
let
  sources = rec {
    nav2_mppi_controller = substituteSource {
      src = fetchgit {
        name = "nav2_mppi_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "08b4b177721f7728db0d97ab714d3bfa0f387b6f";
        hash = "sha256-4CddM03BKfM5pwz77c4aVffGkIep/OMgIakWNQ+zkiY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_mppi_controller";
  version = "1.3.2-1";
  src = sources.nav2_mppi_controller;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [ gbenchmark ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs llvmPackages.openmp nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros visualization_msgs xsimd xtensor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "nav2_mppi_controller";
  };
}
