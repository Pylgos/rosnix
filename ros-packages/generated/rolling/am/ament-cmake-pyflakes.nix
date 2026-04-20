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
  version = "0.20.4-1";
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
        rev = "883b453a5f062c80037304e0d7940df3c5cf371f";
        hash = "sha256-ZnVfMZsca/BcnBQOmwn5q1Edc9HqNlXvAPeorATjjP8=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_pyflakes to check code using pyflakes.\n  ";
  };
})
