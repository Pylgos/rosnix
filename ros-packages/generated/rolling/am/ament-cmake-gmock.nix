{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_gmock";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_gmock";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-gtest ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgmock-dev" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-gtest ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgmock-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_gmock" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gmock-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "3ea66d275c962efc36ff64b6cfccbdb291ff7abc";
        hash = "sha256-+5oDITRS7Pp2Ujv1hnR2lO/sq/14wGb06cz1uoDCKEo=";
      };
    };
  });
  meta = {
    description = "The ability to add Google mock-based tests in the ament buildsystem in CMake.";
  };
})
