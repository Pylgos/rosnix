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
  version = "0.26.9-1";
  src = finalAttrs.passthru.sources."mcap_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ liblz4-vendor zstd-vendor ];
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ liblz4-vendor zstd-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "mcap_vendor" = substituteSource {
      src = fetchgit {
        name = "mcap_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "e143d213b638d9d3836e92b8e4d0c1c2d45118c4";
        hash = "sha256-qxk93/BY8YQ1X0YpquYPJUPrDMlEWGpDSlerUzk2E1U=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.3.1.tar.gz";
          to = "URL ${sources."mcap_vendor/v1"}";
        }
      ];
    };
    "mcap_vendor/v1" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.3.1.tar.gz";
        hash = "sha256-/C1R57YTz8F+2HceqZk13oZRuWd44zK6gnDlw79hq2k=";
      };
    };
  });
  meta = {
    description = "mcap vendor package";
  };
})
