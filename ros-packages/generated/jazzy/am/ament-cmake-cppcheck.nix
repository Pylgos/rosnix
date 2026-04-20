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
  version = "0.17.5-1";
  src = finalAttrs.passthru.sources."ament_cmake_cppcheck";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_cppcheck" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "671bde1df42f480634b6b0e2481cb69c03b66edf";
        hash = "sha256-f9mZZyQqD2jfRyVwRMe1zKHYMiuvbK5QrhLmp2BB7H0=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_cppcheck to perform static code analysis on C/C++\n    code using Cppcheck.\n  ";
  };
})
