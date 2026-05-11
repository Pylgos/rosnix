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
  version = "0.34.0-1";
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
        rev = "b3e59f9096457f134d4fb54d90a7f9689fc46fb4";
        hash = "sha256-p/NT3E5v0HLD2Hdsc+KjZktaBj2PJCXB/gX9zYzEjp4=";
      };
    };
  });
  meta = {
    description = "LZ4 compression cmake module package";
  };
})
