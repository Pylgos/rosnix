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
  pname = "tlsf";
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."tlsf";
  propagatedNativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf" = substituteSource {
      src = fetchgit {
        name = "tlsf-source";
        url = "https://github.com/ros2-gbp/tlsf-release.git";
        rev = "d9015ddbdee3f66acb2e21e76fa5c58c9c2bd71b";
        hash = "sha256-JQZwolX2AxSjfM4uVTVCh5V5ZH+txxPGU5HSXzg/yHU=";
      };
    };
  });
  meta = {
    description = "TLSF allocator version 2.4.6";
  };
})
