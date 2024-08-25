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
        rev = "943d6ee0fbe617528bf6d354d677b8c02f421705";
        hash = "sha256-r9Wr8lJanGqSvsPwBoqPBayo+U48l8fpOq7hPU8aIak=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zlib_point_cloud_transport";
  version = "5.0.0-1";
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
