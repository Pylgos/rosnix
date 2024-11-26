{
  ament-cmake,
  ament-cmake-gtest,
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
  pname = "compressed_depth_image_transport";
  version = "5.0.1-1";
  src = finalAttrs.passthru.sources."compressed_depth_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "compressed_depth_image_transport" = substituteSource {
        src = fetchgit {
          name = "compressed_depth_image_transport-source";
          url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
          rev = "732d8426b787ddd8bbf54f1a60cec314806e844d";
          hash = "sha256-s+YuiWpvfMidK0JK2x5J0/62r9c0xsLuF5QTeJqK/5Y=";
        };
      };
    });
  };
  meta = {
    description = "Compressed_depth_image_transport provides a plugin to image_transport for transparently sending depth images (raw, floating-point) using PNG compression.";
  };
})
