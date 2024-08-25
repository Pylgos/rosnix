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
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    draco_point_cloud_transport = substituteSource {
      src = fetchgit {
        name = "draco_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "b1ef436a9a992f9cf052be9801deb7bfa3ab3628";
        hash = "sha256-13C6MG0wTMliDRFOO6i4akPjQ07MmU5kd1yenn6V4FU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "draco_point_cloud_transport";
  version = "5.0.0-1";
  src = sources.draco_point_cloud_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp rcpputils sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [ "libdraco-dev" ];
  meta = {
    description = "draco_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds encoded with KD tree compression.";
  };
}
