{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  mp2p_icp,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libobs,
  mrpt_libros_bridge,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    mrpt_pointcloud_pipeline = substituteSource {
      src = fetchFromGitHub {
        name = "mrpt_pointcloud_pipeline-source";
        owner = "ros2-gbp";
        repo = "mrpt_navigation-release";
        rev = "8edfc4f5c82df7a6b5f4d3179819f33c296410bd";
        hash = "sha256-mIl08zhenbl9XcYFUKGwGTRdlFclW86Ciy+edlpeKTo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_pointcloud_pipeline";
  version = "2.1.1-1";
  src = sources.mrpt_pointcloud_pipeline;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mp2p_icp mrpt_libgui mrpt_libmaps mrpt_libobs mrpt_libros_bridge nav_msgs rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Maintains a local obstacle map from recent sensor readings, including optional point cloud pipeline filtering or processing.";
  };
}
