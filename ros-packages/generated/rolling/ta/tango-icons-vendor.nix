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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."tango_icons_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "tango-icon-theme" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tango_icons_vendor" = substituteSource {
      src = fetchgit {
        name = "tango_icons_vendor-source";
        url = "https://github.com/ros2-gbp/tango_icons_vendor-release.git";
        rev = "17d4fa8f9744e552bc6377a89d4bbdcc034bd6bb";
        hash = "sha256-AR7odoiueJBcWLzye3meUQS2HzG2u91bTOl/B4YaJQE=";
      };
    };
  });
  meta = {
    description = "tango_icons_vendor provides the public domain Tango icons for non-linux systems (";
  };
})
