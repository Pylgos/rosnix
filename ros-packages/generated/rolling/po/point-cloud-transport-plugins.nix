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
  version = "6.0.1-1";
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
        rev = "afef43705648752eeb3a8b4e1eaddb5f1280be7b";
        hash = "sha256-ui9sR8P8hGDulgM+hG9V0j+UQefj1EmYJDVxNMTC/Ls=";
      };
    };
  });
  meta = {
    description = "Metapackage with common point_cloud_transport plugins";
  };
})
