{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cloudini_lib";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."cloudini_lib";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all-dev" "libpcl-common" "libpcl-io" "libzstd-dev" "lz4" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" "libpcl-common" "libpcl-io" "libzstd-dev" "lz4" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "cloudini_lib" = substituteSource {
      src = fetchgit {
        name = "cloudini_lib-source";
        url = "https://github.com/facontidavide/cloudini-release.git";
        rev = "bec82ffb93fe92d97543229a921df2f1e03533e6";
        hash = "sha256-xu4VIOkzP1siKXauXKlOcfxxnDPSN9FEIGQ7VyGYXK0=";
      };
    };
  });
  meta = {
    description = "\n  Main library of Cloudini, the pointcloud compression library\n  ";
  };
})
