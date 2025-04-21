{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  liblz4-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  zstd-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mcap_vendor";
  version = "0.32.0-1";
  src = finalAttrs.passthru.sources."mcap_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ liblz4-vendor zstd-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "mcap_vendor" = substituteSource {
      src = fetchgit {
        name = "mcap_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "e412f4810fbcf7d57618bfdb313691430ce5d487";
        hash = "sha256-k5yWctIFw06XfWuxwuOtKMju/9so6pVOMM4tDjanprk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.4.0.tar.gz";
          to = "URL ${sources."mcap_vendor/v1"}";
        }
      ];
    };
    "mcap_vendor/v1" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.4.0.tar.gz";
        hash = "sha256-u7ZPj0wOUBuJSKjkEGaOeBJ8tX9LMHi9NCjIdPLM15U=";
      };
    };
  });
  meta = {
    description = "mcap vendor package";
  };
})
