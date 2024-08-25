{
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_graphs,
  fuse_msgs,
  fuse_publishers,
  fuse_variables,
  gbenchmark,
  geometry_msgs,
  nav_msgs,
  pluginlib,
  python3Packages,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_2d,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    fuse_models = substituteSource {
      src = fetchgit {
        name = "fuse_models-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "2c4318f61fc08bbf016e90b265b97ab22dd556ef";
        hash = "sha256-zMP+gaqfbnqA9cfMQ5GnUv6i1FdIPqjTZyRSl5muNv0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_models";
  version = "1.2.0-1";
  src = sources.fuse_models;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver eigen fuse_constraints fuse_core fuse_graphs fuse_msgs fuse_publishers fuse_variables geometry_msgs nav_msgs pluginlib python3Packages.boost rclcpp rclcpp_components sensor_msgs std_srvs tf2 tf2_2d tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common gbenchmark ];
  missingDependencies = [  ];
  meta = {
    description = "fuse plugins that implement various kinematic and sensor models";
  };
}
