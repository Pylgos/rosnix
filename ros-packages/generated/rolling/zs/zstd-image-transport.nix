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
  version = "5.0.1-1";
  src = finalAttrs.passthru.sources."zstd_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zlib" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "zstd_image_transport" = substituteSource {
        src = fetchgit {
          name = "zstd_image_transport-source";
          url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
          rev = "826264799e9260c502aeb319faef52cb9fbe715d";
          hash = "sha256-CSiMZeTgmLzH2SXnVqVZRNRMJ48Rh6/5AABgVOkkifE=";
        };
      };
    });
  };
  meta = {
    description = "zstd_image_transport provides a plugin to image_transport for transparently sending images encoded as zstd blobs";
  };
})
