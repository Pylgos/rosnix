{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-mypy,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_mypy";
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_mypy";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-mypy ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_mypy" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "a996f30cfb57e83bff4d1a6aa46cbbabe608a1af";
        hash = "sha256-yW/bxlHXuDO+CYBZ0yAu/MxMj00UREBAcLXNpR0bivs=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_mypy to perform static type analysis on python code with mypy.";
  };
})
