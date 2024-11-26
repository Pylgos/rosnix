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
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."libcaer_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "libcaer_vendor" = substituteSource {
        src = fetchgit {
          name = "libcaer_vendor-source";
          url = "https://github.com/ros2-gbp/libcaer_vendor-release.git";
          rev = "541500c206151a84a4b2e6c8fc6503690077a69f";
          hash = "sha256-fDxW11ZhQAi6qpSKwjncCFExfZHu7Sq7f0nJem2O2ic=";
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
  };
  meta = {
    description = "Wrapper around libcaer library";
  };
})
