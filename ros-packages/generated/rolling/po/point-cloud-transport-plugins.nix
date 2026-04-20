{
  ament-cmake,
  buildAmentCmakePackage,
  draco-point-cloud-transport,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  point-cloud-interfaces,
  rosSystemPackages,
  substituteSource,
  zlib-point-cloud-transport,
  zstd-point-cloud-transport,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "point_cloud_transport_plugins";
  version = "6.1.0-1";
  src = finalAttrs.passthru.sources."point_cloud_transport_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ draco-point-cloud-transport point-cloud-interfaces zlib-point-cloud-transport zstd-point-cloud-transport ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ draco-point-cloud-transport point-cloud-interfaces zlib-point-cloud-transport zstd-point-cloud-transport ];
  passthru.sources = mkSourceSet (sources: {
    "point_cloud_transport_plugins" = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_plugins-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "bcabe916ea8d07baeaf1e6728d6fc9b282e49183";
        hash = "sha256-hLO6torv9h/h9dH8+3yX3QX5LHV3tdCU9bz85ElbplQ=";
      };
    };
  });
  meta = {
    description = "Metapackage with common point_cloud_transport plugins";
  };
})
