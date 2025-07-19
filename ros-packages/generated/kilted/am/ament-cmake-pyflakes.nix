{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-pyflakes,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_pyflakes";
  version = "0.19.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_pyflakes";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pyflakes ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-pyflakes ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_pyflakes" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "26e5e461890b4d226df5ec557e73b0b7a97b80a8";
        hash = "sha256-0sTf/k1HgFUcA10Vmp1cXpb36SdtZHpaCuOvCXNf4Hw=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_pyflakes to check code using pyflakes.\n  ";
  };
})
