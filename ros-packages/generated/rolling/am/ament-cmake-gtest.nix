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
  pname = "ament_cmake_gtest";
  version = "2.8.7-2";
  src = finalAttrs.passthru.sources."ament_cmake_gtest";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgtest-dev" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgtest-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_gtest" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gtest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "a82d833d2ecdabec899d3cb8125fc9a539c7a55e";
        hash = "sha256-+GaVpyztA9pGm+2ME5g3lEFB7VJ5+Tg3TboglXXrKYs=";
      };
    };
  });
  meta = {
    description = "The ability to add gtest-based tests in the ament buildsystem in CMake.";
  };
})
