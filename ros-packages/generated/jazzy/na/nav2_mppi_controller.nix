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
  geometry_msgs,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
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
    nav2_mppi_controller-08b4b177721f7728db0d97ab714d3bfa0f387b6f = substituteSource {
      src = fetchgit {
        name = "nav2_mppi_controller-08b4b177721f7728db0d97ab714d3bfa0f387b6f-source";
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
  src = sources.nav2_mppi_controller-08b4b177721f7728db0d97ab714d3bfa0f387b6f;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libomp-dev" "xsimd" "xtensor" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "nav2_mppi_controller";
  };
}
