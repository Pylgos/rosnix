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
  version = "5.0.1-1";
  src = finalAttrs.passthru.sources."point_cloud_transport_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ draco-point-cloud-transport point-cloud-interfaces zlib-point-cloud-transport zstd-point-cloud-transport ];
  passthru = {
    sources = mkSourceSet (sources: {
      "point_cloud_transport_plugins" = substituteSource {
        src = fetchgit {
          name = "point_cloud_transport_plugins-source";
          url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
          rev = "f1bf6dbc0fc9d6931dfd5bedbacdc74fcf0a26d0";
          hash = "sha256-t/NYcHfbCUVe/HAat8Z/+Nh5wgugwxyAJzEK6iJnqFA=";
        };
      };
    });
  };
  meta = {
    description = "Metapackage with common point_cloud_transport plugins";
  };
})
