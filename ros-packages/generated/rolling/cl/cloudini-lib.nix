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
  version = "1.0.3-1";
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
        rev = "53d0e498d94d70bbb2045b67187e187f29ff5e8c";
        hash = "sha256-/bm+2ENg0jtYTTlEep8Wm1VIoM+1AhK32EUXBXLzrZs=";
      };
    };
  });
  meta = {
    description = "\n  Main library of Cloudini, the pointcloud compression library\n  ";
  };
})
