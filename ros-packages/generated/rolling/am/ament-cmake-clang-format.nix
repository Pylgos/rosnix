{
  ament-clang-format,
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
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
  pname = "ament_cmake_clang_format";
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_clang_format";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-clang-format ament-cmake-test ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_clang_format" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_clang_format-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "28be42f719a353b4a71a8732c5a5bd38fa0f5cec";
          hash = "sha256-WgvqjoGpQZEHn93WE/MHRZoBJZWorXwHvNw7RVgwiD4=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_clang_format to lint C / C++ code using clang format.";
  };
})
