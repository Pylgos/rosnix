{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  point_cloud_interfaces,
  point_cloud_transport,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    draco_point_cloud_transport-a82bc7999a6ac97fe76280fede4c4d3e486eaee7 = substituteSource {
      src = fetchgit {
        name = "draco_point_cloud_transport-a82bc7999a6ac97fe76280fede4c4d3e486eaee7-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "a82bc7999a6ac97fe76280fede4c4d3e486eaee7";
        hash = "sha256-Pv8YnDdLGd8hGHHgtfiCWcDav6Ig5uyuvdaDZ65Q+kQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "draco_point_cloud_transport";
  version = "4.0.1-1";
  src = sources.draco_point_cloud_transport-a82bc7999a6ac97fe76280fede4c4d3e486eaee7;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp rcpputils sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libdraco-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "draco_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds encoded with KD tree compression.";
  };
}
