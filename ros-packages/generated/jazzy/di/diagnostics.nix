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
  version = "4.2.1-1";
  src = finalAttrs.passthru.sources."diagnostics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-common-diagnostics diagnostic-updater self-test ];
  passthru = {
    sources = mkSourceSet (sources: {
      "diagnostics" = substituteSource {
        src = fetchgit {
          name = "diagnostics-source";
          url = "https://github.com/ros2-gbp/diagnostics-release.git";
          rev = "904ae24d5e00bd38b48157ff4446b384090e42b5";
          hash = "sha256-0AXbNvElkiT1PqbiHubhKiwwmydQlK+XKAjtVPSW45E=";
        };
      };
    });
  };
  meta = {
    description = "diagnostics";
  };
})
