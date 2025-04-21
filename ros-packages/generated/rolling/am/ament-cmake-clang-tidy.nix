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
  version = "0.19.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_clang_tidy";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-clang-tidy ament-cmake-test ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_clang_tidy" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "cd486df079245c79153e72fe486f467961157f97";
        hash = "sha256-8wr10DKmkISkOuLEQY4S3lpecVu9GHKWcmxC+ZFDoC8=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_clang_tidy to lint C / C++ code using clang tidy.";
  };
})
