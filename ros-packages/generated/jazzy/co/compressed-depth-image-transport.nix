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
  version = "4.0.3-1";
  src = finalAttrs.passthru.sources."compressed_depth_image_transport";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "compressed_depth_image_transport" = substituteSource {
      src = fetchgit {
        name = "compressed_depth_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "10e1ca2bebe4386f27b1c34054a0385a95abadc6";
        hash = "sha256-cAVTwfpqbwLA/8Gn2CS4ELT/TZ4+8LVeFRG7tL9dwOI=";
      };
    };
  });
  meta = {
    description = "Compressed_depth_image_transport provides a plugin to image_transport for transparently sending depth images (raw, floating-point) using PNG compression.";
  };
})
