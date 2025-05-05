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
  version = "4.0.4-1";
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
        rev = "79e4b04651c24503f3ca24abcd2296658725f16a";
        hash = "sha256-2apx0E4WeQFkFFndxtVBFPlLLhhksgbm6IVMZFGGBfM=";
      };
    };
  });
  meta = {
    description = "\n    zstd_image_transport provides a plugin to image_transport for transparently sending images\n    encoded as zstd blobs\n  ";
  };
})
