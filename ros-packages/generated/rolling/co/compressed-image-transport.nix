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
  version = "6.1.0-1";
  src = finalAttrs.passthru.sources."compressed_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "compressed_image_transport" = substituteSource {
      src = fetchgit {
        name = "compressed_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "a37fc89e826a03f3d7a30fd15459423895d1f3dd";
        hash = "sha256-8/fYr8lQsSElWKjmi3o9hZiUrIUAZxowqbmExO5sSnk=";
      };
    };
  });
  meta = {
    description = "\n    Compressed_image_transport provides a plugin to image_transport for transparently sending images\n    encoded as JPEG or PNG.\n  ";
  };
})
