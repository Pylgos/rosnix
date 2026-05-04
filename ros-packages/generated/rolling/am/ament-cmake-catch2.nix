{
  ament-cmake-core,
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
  pname = "ament_cmake_catch2";
  version = "1.5.0-2";
  src = finalAttrs.passthru.sources."ament_cmake_catch2";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_catch2" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_catch2-source";
        url = "https://github.com/ros2-gbp/ament_cmake_catch2-release.git";
        rev = "73977db029d0796861c2a25ab8009cfff5de886e";
        hash = "sha256-a4HuIoQTBqimBoeUAKxu4zqFbmPhJkG0BEk6+OZW7s8=";
      };
    };
  });
  meta = {
    description = "Allows integrating catch2 tests in the ament buildsystem with CMake";
  };
})
