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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_gtest";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test gtest-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gtest" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test gtest-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_gtest" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gtest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "203dcecbdcbf65958db5cef9f8e49f5b5ae0f84b";
        hash = "sha256-DVeq5iksmWj1ky/5mW7C8asG8w+40O+eveCJHRHQFCU=";
      };
    };
  });
  meta = {
    description = "The ability to add gtest-based tests in the ament buildsystem in CMake.";
  };
})
