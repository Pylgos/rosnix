{
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_graphs,
  fuse_msgs,
  fuse_publishers,
  fuse_variables,
  geometry_msgs,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
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
        rev = "4b3d2a3c62eda494d2a2dc9feb8d8bb73406c7f1";
        hash = "sha256-N2bDbs4TD0BkUWc4ewNT2KRCMSvN4FvVzTyzBpyOHI4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_models";
  version = "1.1.1-1";
  src = sources.fuse_models;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse_constraints fuse_core fuse_graphs fuse_msgs fuse_publishers fuse_variables geometry_msgs nav_msgs pluginlib rclcpp rclcpp_components sensor_msgs std_srvs tf2 tf2_2d tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  meta = {
    description = "fuse plugins that implement various kinematic and sensor models";
  };
}
