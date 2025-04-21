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
  version = "0.19.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_cppcheck";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_cppcheck" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "451061ff3927554296ef3343131bab36c11a1093";
        hash = "sha256-i0fwChlGRkEr5FlcPzLiNi0RAcUqOBIdQ4l3z/sxurg=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_cppcheck to perform static code analysis on C/C++ code using Cppcheck.";
  };
})
