{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zstd_image_transport";
  version = "6.2.2-1";
  src = finalAttrs.passthru.sources."zstd_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ image-transport ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "zlib" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zlib" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zstd_image_transport" = substituteSource {
      src = fetchgit {
        name = "zstd_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "24be0aa2952087411cc3e750902a6f9549328add";
        hash = "sha256-Z45rzIROiq2Pdxf7QcCnxk8ACOmvZ0g/jprtjoazH2E=";
      };
    };
  });
  meta = {
    description = "\n    zstd_image_transport provides a plugin to image_transport for transparently sending images\n    encoded as zstd blobs\n  ";
  };
})
