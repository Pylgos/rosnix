{
  ament-clang-tidy,
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
  pname = "ament_cmake_clang_tidy";
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_clang_tidy";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-clang-tidy ament-cmake-test ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_clang_tidy" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_clang_tidy-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "5d208020934b96cd9ff1cd8d60bc97d00351c580";
          hash = "sha256-AgIIYvoY08HSh0N8Iq7dyZTDVOCYoAWAJcMvHlSMq2g=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_clang_tidy to lint C / C++ code using clang tidy.";
  };
})
