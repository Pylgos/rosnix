{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mp2p_icp,
  mrpt_libmaps,
  mrpt_libobs,
  mrpt_libros_bridge,
  mrpt_msgs,
  mrpt_nav_interfaces,
  rclcpp_components,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = mkSourceSet (sources: {
    "mrpt_map_server" = substituteSource {
      src = fetchgit {
        name = "mrpt_map_server-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "6fc8ea7bc4990404fb17b7fad496e1df27389016";
        hash = "sha256-rpNgZdhrt9jg15OAcuimTW8LQ3VQM8VysiW+7f3jRHo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mrpt_map_server";
  version = "2.2.0-1";
  src = sources."mrpt_map_server";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mp2p_icp mrpt_libmaps mrpt_libobs mrpt_libros_bridge mrpt_msgs mrpt_nav_interfaces rclcpp_components tf2 tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides a ROS 2 node that publishes a static map for other nodes to use it. Unlike classic ROS 1 ``map_server``, this node can publish a range of different metric maps, not only occupancy grids.";
  };
}
