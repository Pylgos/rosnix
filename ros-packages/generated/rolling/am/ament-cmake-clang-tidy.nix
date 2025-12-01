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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."ament_cmake_clang_tidy";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-clang-tidy ament-cmake-test ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-clang-tidy ament-cmake-test ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_clang_tidy" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ac1d57091269ad1c7b65ecbd8d81291670f80e40";
        hash = "sha256-Wqhiz0Ln08ezfHaM4++AlcaSTUQFpfqOzl0PCiF0PbM=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_clang_tidy to lint C / C++ code using clang tidy.\n  ";
  };
})
