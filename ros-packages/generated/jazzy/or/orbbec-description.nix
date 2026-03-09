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
  version = "2.7.6-1";
  src = finalAttrs.passthru.sources."orbbec_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "orbbec_description" = substituteSource {
      src = fetchgit {
        name = "orbbec_description-source";
        url = "https://github.com/orbbec/orbbec_camera_v2-release.git";
        rev = "f1f00abbe38efc6d2ca1ab5f4125f0ab44d0f1d2";
        hash = "sha256-Zn0K1bWmtt+5HupibU8K8t+w5A+3SH8zvhO3CQ5DYjs=";
      };
    };
  });
  meta = {
    description = "TODO: Package description";
  };
})
