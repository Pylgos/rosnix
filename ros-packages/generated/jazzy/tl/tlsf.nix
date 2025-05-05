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
  version = "0.9.0-3";
  src = finalAttrs.passthru.sources."tlsf";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf" = substituteSource {
      src = fetchgit {
        name = "tlsf-source";
        url = "https://github.com/ros2-gbp/tlsf-release.git";
        rev = "e5404343cc186e3237c2bae081bcc270af9eab45";
        hash = "sha256-y3cjlV+RU4Go9bap7m+OMAdNUie5Z4IAVrrp7tyyBpw=";
      };
    };
  });
  meta = {
    description = "TLSF allocator version 2.4.6";
  };
})
