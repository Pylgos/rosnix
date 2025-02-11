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
  version = "4.2.2-1";
  src = finalAttrs.passthru.sources."diagnostics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-common-diagnostics diagnostic-updater self-test ];
  passthru.sources = mkSourceSet (sources: {
    "diagnostics" = substituteSource {
      src = fetchgit {
        name = "diagnostics-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "19fddf3d2749e4917fbda6a3e89eabcdb45c00ee";
        hash = "sha256-ZLXJXsy9ZbrMDawe+ZWJDYerGJ9p7I4lgOfPdZJ0CZU=";
      };
    };
  });
  meta = {
    description = "diagnostics";
  };
})
