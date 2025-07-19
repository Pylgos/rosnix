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
  version = "0.26.8-1";
  src = finalAttrs.passthru.sources."zstd_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libzstd-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libzstd-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "zstd_vendor" = substituteSource {
      src = fetchgit {
        name = "zstd_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "eefe7f81457508494f90d9790cc50870c4c51834";
        hash = "sha256-u5pL0XVoZzkaen6BpLm2T0aApG0JQYLTeDwvaEasTAI=";
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
