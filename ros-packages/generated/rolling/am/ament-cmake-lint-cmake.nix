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
  version = "0.20.5-3";
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
        rev = "848161359479cadfddb637aab3320497d31ff8c8";
        hash = "sha256-AvurL4Ez9XBnYuJNUnpCokMPgAnzrHAMK4frT13fIT8=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_lint_cmake to lint CMake code using cmakelint.\n  ";
  };
})
