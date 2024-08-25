{
  ament_cmake,
  buildRosPackage,
  draco_point_cloud_transport,
  fetchgit,
  fetchurl,
  fetchzip,
  point_cloud_interfaces,
  substituteSource,
  zlib_point_cloud_transport,
  zstd_point_cloud_transport,
}:
let
  sources = rec {
    point_cloud_transport_plugins = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_plugins-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "797f716f465af208d6c126a912ddb380e372b3c7";
        hash = "sha256-lqeOuoqjhvJnGTFuO9VEnPfroS+x4IC/XGicW8HA0Zw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport_plugins";
  version = "4.0.0-1";
  src = sources.point_cloud_transport_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ draco_point_cloud_transport point_cloud_interfaces zlib_point_cloud_transport zstd_point_cloud_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Metapackage with common point_cloud_transport plugins";
  };
}
