{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mp2p_icp,
  mrpt2,
  mrpt_msgs,
  mrpt_nav_interfaces,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    mrpt_map_server = substituteSource {
      src = fetchgit {
        name = "mrpt_map_server-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "0a6f0731ff6b175aac570d4bdcf93a2218cac192";
        hash = "sha256-UXrilDOL2dQeHHU8av/P5iK4WXG28UPNEs2lFaUnZfA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_map_server";
  version = "2.1.0-1";
  src = sources.mrpt_map_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mp2p_icp mrpt2 mrpt_msgs mrpt_nav_interfaces nav_msgs rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides a ROS 2 node that publishes a static map for other nodes to use it. Unlike classic ROS 1 ``map_server``, this node can publish a range of different metric maps, not only occupancy grids.";
  };
}
