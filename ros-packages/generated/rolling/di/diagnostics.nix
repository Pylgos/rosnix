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
  version = "4.4.6-1";
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
        rev = "152c43840c66e911a1843de56ed6a968b5ea8895";
        hash = "sha256-Q2URIq/bQxp0mHiZCC60NVrdNz6xgbR6eK/edsRDxGI=";
      };
    };
  });
  meta = {
    description = "diagnostics";
  };
})
