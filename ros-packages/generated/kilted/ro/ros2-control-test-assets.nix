{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_control_test_assets";
  version = "5.4.0-1";
  src = finalAttrs.passthru.sources."ros2_control_test_assets";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control_test_assets" = substituteSource {
      src = fetchgit {
        name = "ros2_control_test_assets-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "42bbd20512fc3415758a29e9848a458e1bde839e";
        hash = "sha256-qrJBFiRqZjTnCR63DnFOfEMnRPrONp86U8tCUm7vFzQ=";
      };
    };
  });
  meta = {
    description = "Shared test resources for ros2_control stack";
  };
})
