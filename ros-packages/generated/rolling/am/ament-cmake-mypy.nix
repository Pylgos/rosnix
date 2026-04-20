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
  version = "0.20.4-1";
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
        rev = "459c1f4f8118ce4e3c4f3a684ed1de47b92a6245";
        hash = "sha256-4j2KFwyxgSXcubXg+uIL8b3H+N7qQshvFIBBC5FbFho=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_mypy to perform static type analysis on python code\n    with mypy.\n  ";
  };
})
