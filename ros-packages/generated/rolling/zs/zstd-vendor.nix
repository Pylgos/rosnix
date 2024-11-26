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
  version = "0.29.0-1";
  src = finalAttrs.passthru.sources."zstd_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libzstd-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "zstd_vendor" = substituteSource {
      src = fetchgit {
        name = "zstd_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "c845483874e363d8303f29168e02b14e08bd215c";
        hash = "sha256-/wzAcJ0EHruM0g0IgUx0zjco135bBfUO2YVu/1U7AJA=";
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
