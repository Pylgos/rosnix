{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "compressed_image_transport";
  version = "4.0.4-1";
  src = finalAttrs.passthru.sources."compressed_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "compressed_image_transport" = substituteSource {
      src = fetchgit {
        name = "compressed_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "dcc444d7f793cbeb66f11b74a6cb027cc177f59c";
        hash = "sha256-hPreEOiEkwlacxNQS0STlQdQb+Y0IzYVW18clPu2NpE=";
      };
    };
  });
  meta = {
    description = "Compressed_image_transport provides a plugin to image_transport for transparently sending images encoded as JPEG or PNG.";
  };
})
