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
  version = "4.0.3-1";
  src = finalAttrs.passthru.sources."zstd_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zlib" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zstd_image_transport" = substituteSource {
      src = fetchgit {
        name = "zstd_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "dd946a143ff44a2271fc3a41ca59f7f904db9080";
        hash = "sha256-Hvfx4e4Co5JA2j5XazBrSAZls/UGBGzRVcx8rnpLT0w=";
      };
    };
  });
  meta = {
    description = "zstd_image_transport provides a plugin to image_transport for transparently sending images encoded as zstd blobs";
  };
})
