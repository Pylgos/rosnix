{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cpplint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_cpplint";
  version = "0.19.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_cpplint";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-cpplint ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-cpplint ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_cpplint" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "5125701ba8a2b3a4b08ce7bc3b822c8acb560c4e";
        hash = "sha256-bxVoTNhAJ2eyOIbq2yHN6kTEqUrroehN6FMxAk16MZc=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_cpplint to lint C / C++ code using cpplint.\n  ";
  };
})
