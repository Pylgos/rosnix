{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clips_vendor";
  version = "6.4.3-1";
  src = finalAttrs.passthru.sources."clips_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "unzip" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "unzip" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clips_vendor" = substituteSource {
      src = fetchgit {
        name = "clips_vendor-source";
        url = "https://github.com/ros2-gbp/clips_vendor-release.git";
        rev = "4f682cfbbc9eb4b48bebca4bc132b450f1b70733";
        hash = "sha256-ODWNZFZKzcQicALaeCeY1NDZvGdJEVPBhJb/+m2C8qs=";
      };
    };
  });
  meta = {
    description = "Vendor package for the CLIPS rule based production system";
  };
})
