{
  ament-cmake,
  buildAmentCmakePackage,
  diagnostic-aggregator,
  diagnostic-common-diagnostics,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  self-test,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "diagnostics";
  version = "4.4.3-1";
  src = finalAttrs.passthru.sources."diagnostics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-aggregator diagnostic-common-diagnostics diagnostic-updater self-test ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-common-diagnostics diagnostic-updater self-test ];
  passthru.sources = mkSourceSet (sources: {
    "diagnostics" = substituteSource {
      src = fetchgit {
        name = "diagnostics-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "d4fc42f9cf3daefe7fce53a25451f376c53428b0";
        hash = "sha256-zb5HThag1RKX8VNGC1qV/hoyKPQIAvBqP1jKiCl/EyQ=";
      };
    };
  });
  meta = {
    description = "diagnostics";
  };
})
