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
  version = "0.17.2-1";
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
        rev = "9120fc24c05eaedd8201f4d2832e53211f7544e9";
        hash = "sha256-sJNErzc1jTJbe7/1Crg54CYG7toYIGnp0+ZRaJk+Y9I=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_clang_format to lint C / C++ code using clang format.\n  ";
  };
})
