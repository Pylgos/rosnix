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
  version = "0.34.0-1";
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
        rev = "261bddf939e4a01f04e9ae7d2e19bed24a69f47f";
        hash = "sha256-wHhcw16xnLBfoTcW1EYoLSSpgrOCJHW9HJ9mYf3xkwk=";
      };
    };
  });
  meta = {
    description = "ZSTD compression cmake module package";
  };
})
