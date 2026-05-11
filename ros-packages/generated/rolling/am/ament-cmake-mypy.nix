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
  version = "0.21.0-1";
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
        rev = "439310e8cc831f969bc4dfb107d204dd4988f49f";
        hash = "sha256-Fn6kP+lUOyqJzB9ryAOl0a+/k1XkeDL96qnTowxHWHw=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_mypy to perform static type analysis on python code\n    with mypy.\n  ";
  };
})
