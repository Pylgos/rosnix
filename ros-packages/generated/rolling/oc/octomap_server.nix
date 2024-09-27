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
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
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
    octomap_server-8b4e04118143d4f1c9d6b1c357b40fbebfe88732 = substituteSource {
      src = fetchgit {
        name = "octomap_server-8b4e04118143d4f1c9d6b1c357b40fbebfe88732-source";
        url = "https://github.com/ros2-gbp/octomap_mapping-release.git";
        rev = "8b4e04118143d4f1c9d6b1c357b40fbebfe88732";
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
  src = sources.octomap_server-8b4e04118143d4f1c9d6b1c357b40fbebfe88732;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs message_filters nav_msgs octomap_msgs octomap_ros pcl_conversions pcl_ros rclcpp rclcpp_components sensor_msgs std_msgs std_srvs tf2 tf2_eigen tf2_geometry_msgs tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "octomap_server loads a 3D map (as Octree-based OctoMap) and distributes it to other nodes in a compact binary format. It also allows to incrementally build 3D OctoMaps, and provides map saving in the node octomap_saver.";
  };
}
