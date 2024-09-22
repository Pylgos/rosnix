{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  nav2_common,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  tf2,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    nav2_map_server = substituteSource {
      src = fetchFromGitHub {
        name = "nav2_map_server-source";
        owner = "SteveMacenski";
        repo = "navigation2-release";
        rev = "2cc46a8da02d1bf47c55e6f879f28f1f83fbab36";
        hash = "sha256-WRK3aQuENt5qMq+gPo495n3d4g5uXTLEGmk2y1S/OXw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_map_server";
  version = "1.3.2-1";
  src = sources.nav2_map_server;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch_ros launch_testing nav2_common nav2_msgs nav2_util nav_msgs rclcpp rclcpp_lifecycle std_msgs tf2 yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphicsmagick" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Refactored map server for ROS2 Navigation";
  };
}
