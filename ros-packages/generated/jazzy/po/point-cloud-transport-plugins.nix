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
  version = "4.0.2-1";
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
        rev = "fffd67aeef75c2b7a0470a73336841fbeef04939";
        hash = "sha256-DruxxWvRrLAT6Q9Ld9+ijKYBYqnOuZPETNBIfWdO7AQ=";
      };
    };
  });
  meta = {
    description = "Metapackage with common point_cloud_transport plugins";
  };
})
