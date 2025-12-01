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
  version = "0.20.3-1";
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
        rev = "68e659aa7c9823d2858c32f6f0ee7859ebc3b16d";
        hash = "sha256-gKsBKUl57CRcweW7tFe9yCNvm07l+Ou2DVis4ONW3Fw=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_pyflakes to check code using pyflakes.\n  ";
  };
})
