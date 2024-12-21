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
  version = "0.26.6-1";
  src = finalAttrs.passthru.sources."mcap_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ liblz4-vendor zstd-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "mcap_vendor" = substituteSource {
      src = fetchgit {
        name = "mcap_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "72c40f769b63c56c9f1a0856ce570da06e89aba6";
        hash = "sha256-E7TWlEaMoUDjXcoX9A47L3JArzAk6xZ9GISp/cpyo4A=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.3.0.tar.gz";
          to = "URL ${sources."mcap_vendor/v1"}";
        }
      ];
    };
    "mcap_vendor/v1" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.3.0.tar.gz";
        hash = "sha256-vGMdVNa0wsX9OD0W29Ndk2YmwFphmxPbiovCXtHxF4E=";
      };
    };
  });
  meta = {
    description = "mcap vendor package";
  };
})
