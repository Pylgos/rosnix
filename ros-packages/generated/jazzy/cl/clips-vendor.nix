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
  version = "6.4.3-2";
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
        rev = "39be2a87760b71f3e3a6bbe75eba3a45294f4574";
        hash = "sha256-ODWNZFZKzcQicALaeCeY1NDZvGdJEVPBhJb/+m2C8qs=";
      };
    };
  });
  meta = {
    description = "Vendor package for the CLIPS rule based production system";
  };
})
