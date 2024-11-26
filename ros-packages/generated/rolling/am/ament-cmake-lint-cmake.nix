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
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_lint_cmake";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-lint-cmake ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_lint_cmake" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_lint_cmake-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "228ffe8e95436b4be6327821202a8fd6648e41d6";
          hash = "sha256-vpIPA/2jNpkkyftA8XO1HPY9Zc5/YeWXyVPDmCs3Saw=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_lint_cmake to lint CMake code using cmakelint.";
  };
})
