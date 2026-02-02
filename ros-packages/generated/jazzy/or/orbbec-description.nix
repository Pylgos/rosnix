{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "orbbec_description";
  version = "2.6.3-1";
  src = finalAttrs.passthru.sources."orbbec_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "orbbec_description" = substituteSource {
      src = fetchgit {
        name = "orbbec_description-source";
        url = "https://github.com/orbbec/orbbec_camera_v2-release.git";
        rev = "17223599bb41a1e2b0a54f95681c7053f7725f57";
        hash = "sha256-Wmc5612uDjd6MKV3NXjkYxbWM8zRAxMFC1UwwoejsBg=";
      };
    };
  });
  meta = {
    description = "TODO: Package description";
  };
})
