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
  version = "5.0.3-1";
  src = finalAttrs.passthru.sources."compressed_depth_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "compressed_depth_image_transport" = substituteSource {
      src = fetchgit {
        name = "compressed_depth_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "3b08a6fc55b073e8891313856a17cd6335cd86d2";
        hash = "sha256-/F1shXZmRv6cm2pqek36wlBuZaxoR1za4xGiwVFNC2E=";
      };
    };
  });
  meta = {
    description = "\n    Compressed_depth_image_transport provides a plugin to image_transport for transparently sending\n    depth images (raw, floating-point) using PNG compression.\n  ";
  };
})
