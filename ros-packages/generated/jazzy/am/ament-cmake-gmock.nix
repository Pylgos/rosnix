{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gmock-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_gmock";
  version = "2.5.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_gmock";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-gtest ament-cmake-test gmock-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "google-mock" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-gtest ament-cmake-test gmock-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "google-mock" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_gmock" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_gmock-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "dcd47081d7ad3bdf2aec1c295a33529487ad49e2";
          hash = "sha256-p/ujgJpEj8qGsnCzolischryGUnC4CVUFElTuHwJsLc=";
        };
      };
    });
  };
  meta = {
    description = "The ability to add Google mock-based tests in the ament buildsystem in CMake.";
  };
})
