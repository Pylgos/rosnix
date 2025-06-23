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
  version = "0.20.1-1";
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
        rev = "893355c1da961e3d2b06c490b20f9ad430e09d26";
        hash = "sha256-/1yZy6d67+feGJ1RArM0xsEu8MjBV31jORl06HaULHw=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_lint_cmake to lint CMake code using cmakelint.\n  ";
  };
})
