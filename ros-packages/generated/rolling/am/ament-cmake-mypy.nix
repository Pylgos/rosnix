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
  version = "0.20.5-3";
  src = finalAttrs.passthru.sources."ament_cmake_mypy";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-mypy ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-mypy ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_mypy" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "fb7e1ba97b5f5bd4f32207674b6526d736b74cd2";
        hash = "sha256-H+TMwHR1k5FeAEuS/N4Bxp0L8A4Lsz9vzCakmC7Rzxo=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_mypy to perform static type analysis on python code\n    with mypy.\n  ";
  };
})
