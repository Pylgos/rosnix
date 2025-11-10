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
  version = "2.5.4-2";
  src = finalAttrs.passthru.sources."orbbec_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "orbbec_description" = substituteSource {
      src = fetchgit {
        name = "orbbec_description-source";
        url = "https://github.com/orbbec/orbbec_camera_v2-release.git";
        rev = "269549451a0c298be85a0bc34879e0dda8573a91";
        hash = "sha256-LonYhqNNe+sILVhlSGKXRaxFMFdGf4s7qzwuDRUi08w=";
      };
    };
  });
  meta = {
    description = "TODO: Package description";
  };
})
