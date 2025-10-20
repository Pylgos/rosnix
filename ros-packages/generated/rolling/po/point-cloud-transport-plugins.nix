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
  version = "5.0.2-1";
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
        rev = "46a46c211925380cabee40b9cd348e2f12ecfdcc";
        hash = "sha256-RefA7aaztbOznpUSx1pLTqmIG2fVdcryf23vE7n1aTk=";
      };
    };
  });
  meta = {
    description = "Metapackage with common point_cloud_transport plugins";
  };
})
