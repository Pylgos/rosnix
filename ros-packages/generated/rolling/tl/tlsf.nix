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
  version = "0.12.0-1";
  src = finalAttrs.passthru.sources."tlsf";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf" = substituteSource {
      src = fetchgit {
        name = "tlsf-source";
        url = "https://github.com/ros2-gbp/tlsf-release.git";
        rev = "b4956d020f280c47a60e725ed97524c8e3e1b5a5";
        hash = "sha256-fINLElCylgICTEKavlTjxNZnS97NOByJTOZ7n/YDICs=";
      };
    };
  });
  meta = {
    description = "TLSF allocator version 2.4.6";
  };
})
