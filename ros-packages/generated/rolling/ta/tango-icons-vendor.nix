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
  version = "0.6.0-1";
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
        rev = "029cd956a712729f97acab916d69366c223b1de8";
        hash = "sha256-x6IB5hUBcNfNT1Bf3cGMDDA2jH4Umy4ks6k4LTGj4cw=";
      };
    };
  });
  meta = {
    description = "tango_icons_vendor provides the public domain Tango icons for non-linux systems (";
  };
})
