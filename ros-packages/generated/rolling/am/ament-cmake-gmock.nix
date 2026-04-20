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
  version = "2.8.7-1";
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
        rev = "011eebdc6bad54cfd65c8911c0bba8697c4abf5e";
        hash = "sha256-ja896C3W1syGp/vdYWW53kd/lx3RpbA9Eg/jDi05gBQ=";
      };
    };
  });
  meta = {
    description = "The ability to add Google mock-based tests in the ament buildsystem in CMake.";
  };
})
