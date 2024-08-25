{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_collision_monitor = substituteSource {
      src = fetchgit {
        name = "nav2_collision_monitor-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "555514ea871c57c4d96f7b9efe16196c19515726";
        hash = "sha256-jJEfn6HjtESHmPRu/RBPBx+eZGbCPxwbnjXI7n4mdtY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_collision_monitor";
  version = "1.3.1-1";
  src = sources.nav2_collision_monitor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_costmap_2d nav2_msgs nav2_util rclcpp rclcpp_components sensor_msgs std_msgs tf2 tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Collision Monitor";
  };
}
