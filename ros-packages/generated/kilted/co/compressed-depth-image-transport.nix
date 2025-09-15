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
  version = "5.1.1-1";
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
        rev = "fbba1ab0170ac719202512bd47e95bf77a8d1917";
        hash = "sha256-I0vZOnPzIa5JYgZ4XH566PLScmGQKxRT2hYDPKu9xc8=";
      };
    };
  });
  meta = {
    description = "\n    Compressed_depth_image_transport provides a plugin to image_transport for transparently sending\n    depth images (raw, floating-point) using PNG compression.\n  ";
  };
})
