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
  substituteSource,
  zstd,
}:
let
  sources = rec {
    zstd_point_cloud_transport = substituteSource {
      src = fetchgit {
        name = "zstd_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "04d708485de20185456969652a157404a954d9c4";
        hash = "sha256-viBuWEhPj5eyh8eDqlw/uHeugJ60NB1BPVW86J6/D4g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_point_cloud_transport";
  version = "5.0.0-1";
  src = sources.zstd_point_cloud_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp zstd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "zstd_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds encoded with lib";
  };
}
