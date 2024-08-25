{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  nav_msgs,
  octomap_msgs,
  octomap_ros,
  pcl,
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    octomap_server = substituteSource {
      src = fetchgit {
        name = "octomap_server-source";
        url = "https://github.com/ros2-gbp/octomap_mapping-release.git";
        rev = "d50f0f59e12b7ed1dd6a733a170fb1e5f494891a";
        hash = "sha256-qokWpx6Dn8+CCs6PtkaIlxri9WRcZqpqj34kbhZR1Cc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_server";
  version = "2.3.0-1";
  src = sources.octomap_server;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs message_filters nav_msgs octomap_msgs octomap_ros pcl pcl_conversions pcl_ros rclcpp rclcpp_components sensor_msgs std_msgs std_srvs tf2 tf2_eigen tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [ "liboctomap-dev" ];
  meta = {
    description = "octomap_server loads a 3D map (as Octree-based OctoMap) and distributes it to other nodes in a compact binary format. It also allows to incrementally build 3D OctoMaps, and provides map saving in the node octomap_saver.";
  };
}
