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
  version = "4.4.2-1";
  src = finalAttrs.passthru.sources."diagnostics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-common-diagnostics diagnostic-updater self-test ];
  passthru.sources = mkSourceSet (sources: {
    "diagnostics" = substituteSource {
      src = fetchgit {
        name = "diagnostics-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "2eade1d89685cf15ce24ec1a54077326dea5d275";
        hash = "sha256-DIUlZXkOseJAqbASrzYFAldZfVmVpzxW+fIbVSdCfq0=";
      };
    };
  });
  meta = {
    description = "diagnostics";
  };
})
