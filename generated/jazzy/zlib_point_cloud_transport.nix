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
  zlib,
}:
let
  sources = rec {
    zlib_point_cloud_transport = substituteSource {
      src = fetchgit {
        name = "zlib_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "2441ec9bf116a62674c254cfad1811611ab5df93";
        hash = "sha256-agDsR7TmrKKFOcq/JtuQdYftIST1fDPevcsQHzXS4EY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zlib_point_cloud_transport";
  version = "4.0.0-1";
  src = sources.zlib_point_cloud_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "zlib_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds encoded with zlib";
  };
}
