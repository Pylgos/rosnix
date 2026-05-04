{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lz4-cmake-module,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  zstd-cmake-module,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mcap_vendor";
  version = "0.33.1-2";
  src = finalAttrs.passthru.sources."mcap_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ lz4-cmake-module zstd-cmake-module ];
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ lz4-cmake-module zstd-cmake-module ];
  passthru.sources = mkSourceSet (sources: {
    "mcap_vendor" = substituteSource {
      src = fetchgit {
        name = "mcap_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "89ace1399fa99ccfe7f2219d8e2f86b6030825fb";
        hash = "sha256-TTEShiuY+9hnZFHMX4lqYOBZ7kkK0Dm9oX9s0ddWoD8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v2.1.3.tar.gz";
          to = "URL ${sources."mcap_vendor/v2"}";
        }
      ];
    };
    "mcap_vendor/v2" = substituteSource {
      src = fetchzip {
        name = "v2-source";
        url = "https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v2.1.3.tar.gz";
        hash = "sha256-yFORkrZT059ENaDewIZ5wz6yIOMyqvpeBp2Sq6XOFYw=";
      };
    };
  });
  meta = {
    description = "mcap vendor package";
  };
})
