{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  graphicsmagick,
  launch,
  launch_ros,
  launch_testing,
  nav2_common,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  rclcpp,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
  tf2,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    nav2_map_server = substituteSource {
      src = fetchgit {
        name = "nav2_map_server-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "0391957d785d72e71b5091a084a5a9e9c1f2e8f7";
        hash = "sha256-roqUdRVxi+FHoy+uPceq1cpI/en8ev/aMeliiPjeTXo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_map_server";
  version = "1.3.1-1";
  src = sources.nav2_map_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ graphicsmagick launch_ros launch_testing nav2_common nav2_msgs nav2_util nav_msgs rclcpp rclcpp_lifecycle std_msgs tf2 yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing ];
  missingDependencies = [  ];
  meta = {
    description = "Refactored map server for ROS2 Navigation";
  };
}
