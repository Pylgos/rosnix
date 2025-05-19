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
  version = "4.4.4-1";
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
        rev = "7ebd3f4662e5f591ecd34e2fef4695272494b326";
        hash = "sha256-wxHVDSsBmhJh2DuiKICTFlsDZNdIQnfVE2t0EgchTxA=";
      };
    };
  });
  meta = {
    description = "diagnostics";
  };
})
