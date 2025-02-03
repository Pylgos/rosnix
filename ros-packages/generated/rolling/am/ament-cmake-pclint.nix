{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-pclint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_pclint";
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_pclint";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pclint ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_pclint" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "fe31199b9d0230bc361808e0d1718a68177984bb";
        hash = "sha256-XAPeRNEn6LXXLrdVGscrJOYRGT4/h9LqzjF2GhMxsuI=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_pclint to perform static code analysis on C/C++ code using PC-lint.";
  };
})
