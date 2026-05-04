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
  version = "6.2.4-2";
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
        rev = "2eb7021307281d447d366c5fcdea85750d9c439f";
        hash = "sha256-V7bGyjUB2B+qg8gagSQi5feoc2D6+2vmjMh/gYNP3dQ=";
      };
    };
  });
  meta = {
    description = "\n    zstd_image_transport provides a plugin to image_transport for transparently sending images\n    encoded as zstd blobs\n  ";
  };
})
