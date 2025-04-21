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
  pname = "zstd_vendor";
  version = "0.32.0-1";
  src = finalAttrs.passthru.sources."zstd_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libzstd-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "zstd_vendor" = substituteSource {
      src = fetchgit {
        name = "zstd_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2b3f2521352935c41936a4fc97df212a870f0b9d";
        hash = "sha256-McdSKMOmJ/Z4XpR7pToua65eQm5l4AT71kSjYX/y5MA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/facebook/zstd.git";
          to = "VCS_TYPE path VCS_URL ${sources."zstd_vendor/zstd"}";
        }
      ];
    };
    "zstd_vendor/zstd" = substituteSource {
      src = fetchgit {
        name = "zstd-source";
        url = "https://github.com/facebook/zstd.git";
        rev = "63779c798237346c2b245c546c40b72a5a5913fe";
        hash = "sha256-tHHHIsQU7vJySrVhJuMKUSq11MzkmC+Pcsj00uFJdnQ=";
      };
    };
  });
  meta = {
    description = "Zstd compression vendor package, providing a dependency for Zstd.";
  };
})
