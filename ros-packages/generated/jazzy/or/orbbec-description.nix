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
  version = "2.5.5-3";
  src = finalAttrs.passthru.sources."orbbec_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "orbbec_description" = substituteSource {
      src = fetchgit {
        name = "orbbec_description-source";
        url = "https://github.com/orbbec/orbbec_camera_v2-release.git";
        rev = "8831cdbe7c9318ff43b80f4ea49d3241de851f95";
        hash = "sha256-+4jumS8Xxm+d2uaDwpEDZMHoybCYQloJmYMixIy9xXU=";
      };
    };
  });
  meta = {
    description = "TODO: Package description";
  };
})
