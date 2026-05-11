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
  version = "0.34.0-1";
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
        rev = "eb5a8c4863f6b42477b651d510d6e246140ff610";
        hash = "sha256-QiYYFu2jLj83mqARbui0m+ViMZKjq6lB2zJTQXeq9B4=";
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
