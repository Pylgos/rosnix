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
  version = "1.5.14-1";
  src = finalAttrs.passthru.sources."orbbec_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "orbbec_description" = substituteSource {
      src = fetchgit {
        name = "orbbec_description-source";
        url = "https://github.com/orbbec/orbbec_camera_v1-release.git";
        rev = "e9e414c36fb2f654be85632620ed92a50c3b7641";
        hash = "sha256-fcARJbhL8DFQAm+xl8YlN7ii9tfeUdblpBVbHoI3xsg=";
      };
    };
  });
  meta = {
    description = "TODO: Package description";
  };
})
