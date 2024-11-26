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
  version = "0.10.1-1";
  src = finalAttrs.passthru.sources."tlsf";
  propagatedNativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tlsf" = substituteSource {
        src = fetchgit {
          name = "tlsf-source";
          url = "https://github.com/ros2-gbp/tlsf-release.git";
          rev = "e531350f83af805ebd943fbdb9441d99f32d9fc2";
          hash = "sha256-l0n+RSa9S4bvyqWuWXlrzntdecd1y3yxjfRagf8oms8=";
        };
      };
    });
  };
  meta = {
    description = "TLSF allocator version 2.4.6";
  };
})
