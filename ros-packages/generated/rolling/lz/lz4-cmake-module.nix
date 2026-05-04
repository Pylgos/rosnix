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
  pname = "lz4_cmake_module";
  version = "0.33.1-2";
  src = finalAttrs.passthru.sources."lz4_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "liblz4-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "liblz4-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lz4_cmake_module" = substituteSource {
      src = fetchgit {
        name = "lz4_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "c77209f82f5630c16c3203804c2a29af6db2005a";
        hash = "sha256-51TQquoNIW6Rp0zXgbepGFhgib8NPqvlW/TMjjTMJYo=";
      };
    };
  });
  meta = {
    description = "LZ4 compression cmake module package";
  };
})
