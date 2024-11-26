{
  ament-cmake-core,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_gtest";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_gtest";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test gtest-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gtest" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test gtest-vendor ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_gtest" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_gtest-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "81e282b23428e835b85468e8650e1466df71dfd8";
          hash = "sha256-s0FcdiMMkvQCAL971jakFr5SB7fe1Mj3TjXJBob7MTk=";
        };
      };
    });
  };
  meta = {
    description = "The ability to add gtest-based tests in the ament buildsystem in CMake.";
  };
})
