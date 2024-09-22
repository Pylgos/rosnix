{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mp2p_icp,
  mrpt_libmaps,
  mrpt_libros_bridge,
  mrpt_msgs,
  mrpt_nav_interfaces,
  rclcpp_components,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mrpt_map_server = substituteSource {
      src = fetchgit {
        name = "mrpt_map_server-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "ba71d887041986413bfa60902ea457b6c9d0c610";
        hash = "sha256-WOxRFsyYcYHInT2omNnufVfXdaLXyF9JJLXrAHCuTm0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_map_server";
  version = "2.1.1-1";
  src = sources.mrpt_map_server;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mp2p_icp mrpt_libmaps mrpt_libros_bridge mrpt_msgs mrpt_nav_interfaces rclcpp_components ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides a ROS 2 node that publishes a static map for other nodes to use it. Unlike classic ROS 1 ``map_server``, this node can publish a range of different metric maps, not only occupancy grids.";
  };
}
