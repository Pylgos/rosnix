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
  nav_msgs,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    mrpt_pointcloud_pipeline = substituteSource {
      src = fetchgit {
        name = "mrpt_pointcloud_pipeline-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "0b8fab1591a7989ba259ec224660a5c659536283";
        hash = "sha256-Z19VT8yEdUUFL2OL/EnIHcchGibYQ92OIGcCmjIA26s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_pointcloud_pipeline";
  version = "2.1.0-1";
  src = sources.mrpt_pointcloud_pipeline;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mp2p_icp mrpt2 nav_msgs rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Maintains a local obstacle map from recent sensor readings, including optional point cloud pipeline filtering or processing.";
  };
}
