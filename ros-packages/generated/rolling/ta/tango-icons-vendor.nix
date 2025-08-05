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
  pname = "tango_icons_vendor";
  version = "0.5.1-1";
  src = finalAttrs.passthru.sources."tango_icons_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "tango-icon-theme" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "tango-icon-theme" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tango_icons_vendor" = substituteSource {
      src = fetchgit {
        name = "tango_icons_vendor-source";
        url = "https://github.com/ros2-gbp/tango_icons_vendor-release.git";
        rev = "42d56cf225f1baa03ebfb13333f7c504e0c612de";
        hash = "sha256-8q6lh+GaVoDDMp/1FRL9nWgo/7n4tYifCORXxPEzfJc=";
      };
    };
  });
  meta = {
    description = "tango_icons_vendor provides the public domain Tango icons for non-linux systems (";
  };
})
