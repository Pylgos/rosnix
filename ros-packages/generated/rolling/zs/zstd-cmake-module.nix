{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zstd_cmake_module";
  version = "0.33.1-1";
  src = finalAttrs.passthru.sources."zstd_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libzstd-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libzstd-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zstd_cmake_module" = substituteSource {
      src = fetchgit {
        name = "zstd_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "7b5184f2093b7313d4b377035910469a96ed829e";
        hash = "sha256-Gfiwcm7QQFbqjcPxK2ivTvw43AvH8JScUat2zk42bTw=";
      };
    };
  });
  meta = {
    description = "ZSTD compression cmake module package";
  };
})
