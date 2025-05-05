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
  version = "5.0.2-1";
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
        rev = "62f9df6ed9b990d1e4f564e69d50f498a7cd0b2d";
        hash = "sha256-xU+Xa79xNXM47OkR2g5L4tId7cqX6Z9P1aD0UeWjdMw=";
      };
    };
  });
  meta = {
    description = "\n    zstd_image_transport provides a plugin to image_transport for transparently sending images\n    encoded as zstd blobs\n  ";
  };
})
