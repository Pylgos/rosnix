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
        rev = "77426da99faa0de7902f8e485b8bb8e734b1cb6b";
        hash = "sha256-9wxt6r6TXQA5ZLicEyxtFcw3iMjJ4dB+SivN/Kg4JBw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport_plugins";
  version = "5.0.0-1";
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
