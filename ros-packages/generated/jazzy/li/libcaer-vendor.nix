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
  pname = "libcaer_vendor";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."libcaer_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libcaer_vendor" = substituteSource {
      src = fetchgit {
        name = "libcaer_vendor-source";
        url = "https://github.com/ros2-gbp/libcaer_vendor-release.git";
        rev = "0424ca45235d713578a786c73480717ad9b316d6";
        hash = "sha256-qbXJBtbU/GC6K5vEd6Dt1V5gnwyiWAhWD/mya3K/z40=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://gitlab.com/inivation/dv/libcaer.git";
          to = "VCS_TYPE path VCS_URL ${sources."libcaer_vendor/libcaer"}";
        }
      ];
    };
    "libcaer_vendor/libcaer" = substituteSource {
      src = fetchgit {
        name = "libcaer-source";
        url = "https://gitlab.com/inivation/dv/libcaer.git";
        rev = "8710e73ceb21d9fb4f74ead62ca3fae42d828997";
        hash = "sha256-aTQw4K7otT7MP6qNediqzgjqbM6Wldg6bzwBTzX34II=";
      };
    };
  });
  meta = {
    description = "Wrapper around libcaer library";
  };
})
