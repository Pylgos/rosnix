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
  version = "5.0.1-1";
  src = finalAttrs.passthru.sources."compressed_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "compressed_image_transport" = substituteSource {
        src = fetchgit {
          name = "compressed_image_transport-source";
          url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
          rev = "8ad8dcccffb2d7b58d9436539acbafffe92d5cb5";
          hash = "sha256-gWHw4IShEiNDzI2sFfAq9u6lQmED0ObO2kOZbl7CeaI=";
        };
      };
    });
  };
  meta = {
    description = "Compressed_image_transport provides a plugin to image_transport for transparently sending images encoded as JPEG or PNG.";
  };
})
