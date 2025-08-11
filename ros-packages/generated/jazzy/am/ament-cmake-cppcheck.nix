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
  version = "0.17.3-1";
  src = finalAttrs.passthru.sources."ament_cmake_cppcheck";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ament-cppcheck ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_cppcheck" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "b165a25c468bc63cec8652cdf044cd57530076f8";
        hash = "sha256-/aPrszBWK8CSrTPB9afKabXAlVpURfXBlucSehSE5x4=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_cppcheck to perform static code analysis on C/C++\n    code using Cppcheck.\n  ";
  };
})
