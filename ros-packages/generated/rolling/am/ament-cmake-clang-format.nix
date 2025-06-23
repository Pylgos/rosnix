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
  version = "0.20.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_clang_format";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-clang-format ament-cmake-test ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-clang-format ament-cmake-test ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_clang_format" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_format-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "926e16dc4fb7443161765e85428b283999f9304d";
        hash = "sha256-c+rmbopHAf1krHh6dDBjAPUtSJvMQGnbbXgjJieghIg=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_clang_format to lint C / C++ code using clang format.\n  ";
  };
})
