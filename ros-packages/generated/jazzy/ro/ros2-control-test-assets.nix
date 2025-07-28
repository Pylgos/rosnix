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
  version = "4.34.0-1";
  src = finalAttrs.passthru.sources."ros2_control_test_assets";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control_test_assets" = substituteSource {
      src = fetchgit {
        name = "ros2_control_test_assets-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "4078085d638f098cf80afc88237a5a0b7bd4bb8f";
        hash = "sha256-qD6Mb2DbED09NJerLzdQn1PBR21UGYrkndEsn18th5k=";
      };
    };
  });
  meta = {
    description = "Shared test resources for ros2_control stack";
  };
})
