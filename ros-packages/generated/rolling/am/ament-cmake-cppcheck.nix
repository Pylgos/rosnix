{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cppcheck,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_cppcheck";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."ament_cmake_cppcheck";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_cppcheck" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "18df42043f9cacba95b8af84212118aa5e9abe59";
        hash = "sha256-42x/Rd+p/jEfK2lT4vG/BHp6uNQb1UWm3i9d7uXH1hI=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_cppcheck to perform static code analysis on C/C++\n    code using Cppcheck.\n  ";
  };
})
