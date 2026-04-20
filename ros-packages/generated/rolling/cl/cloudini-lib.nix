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
  version = "1.0.4-1";
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
        rev = "366d5aea3aaf6f16d09d4354c5a29033e521145f";
        hash = "sha256-SwDt3P2Pivxm1+VYCLeHWFzJ18G7+Wnk3cap/1/WmUQ=";
      };
    };
  });
  meta = {
    description = "\n  Main library of Cloudini, the pointcloud compression library\n  ";
  };
})
