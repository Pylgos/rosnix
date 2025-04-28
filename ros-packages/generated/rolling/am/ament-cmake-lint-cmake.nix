{
  ament-cmake-core,
  ament-cmake-test,
  ament-lint-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_lint_cmake";
  version = "0.20.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_lint_cmake";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-lint-cmake ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_lint_cmake" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_lint_cmake-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ebb82895c74097e8850dc7707bc6d61d7d80ef3b";
        hash = "sha256-ymBp9v+YQx+U+vUK395sewwx4s+qNRjLyvDryzWSehs=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_lint_cmake to lint CMake code using cmakelint.";
  };
})
