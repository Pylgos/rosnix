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
  version = "4.3.1-1";
  src = finalAttrs.passthru.sources."diagnostics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-common-diagnostics diagnostic-updater self-test ];
  passthru = {
    sources = mkSourceSet (sources: {
      "diagnostics" = substituteSource {
        src = fetchgit {
          name = "diagnostics-source";
          url = "https://github.com/ros2-gbp/diagnostics-release.git";
          rev = "ce42e22097ad15f7516fde4b083340ca50eb47ff";
          hash = "sha256-l3QPJ4Xu3yMkA7yhNrczocqHrcyZKJZIGh2zU5k7oRk=";
        };
      };
    });
  };
  meta = {
    description = "diagnostics";
  };
})
