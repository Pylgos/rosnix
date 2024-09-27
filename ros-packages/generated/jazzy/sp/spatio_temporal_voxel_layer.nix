{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  laser_geometry,
  message_filters,
  nav2_costmap_2d,
  openvdb_vendor,
  pcl_conversions,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    spatio_temporal_voxel_layer-b90240ec24e8493687336fa512d84fded305a7d8 = substituteSource {
      src = fetchgit {
        name = "spatio_temporal_voxel_layer-b90240ec24e8493687336fa512d84fded305a7d8-source";
        url = "https://github.com/SteveMacenski/spatio_temporal_voxel_layer-release.git";
        rev = "b90240ec24e8493687336fa512d84fded305a7d8";
        hash = "sha256-TI+acykuLfFK0oE0y9ADZZKcvn02EJ4JPHkP88+jaz4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spatio_temporal_voxel_layer";
  version = "2.5.2-1";
  src = sources.spatio_temporal_voxel_layer-b90240ec24e8493687336fa512d84fded305a7d8;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs laser_geometry message_filters nav2_costmap_2d openvdb_vendor pcl_conversions pluginlib rclcpp rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2_geometry_msgs tf2_ros tf2_sensor_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopenexr-dev" "libpcl-all-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The spatio-temporal 3D obstacle costmap package";
  };
}
