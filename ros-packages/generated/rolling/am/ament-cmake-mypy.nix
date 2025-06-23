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
  version = "0.20.1-1";
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
        rev = "0b585561180ed90f7baca82f7eb9e031b151e482";
        hash = "sha256-G/99Qg1MBNL8tV7uTOeawSrBi9G46P/eZ9JHpHa1eJE=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_mypy to perform static type analysis on python code\n    with mypy.\n  ";
  };
})
