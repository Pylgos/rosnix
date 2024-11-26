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
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_pclint";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pclint ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_pclint" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_pclint-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "3459cb0576ac9ad66b0f8ed1b80e5cf8651b53d4";
          hash = "sha256-8N3KHyFUrqrGO/YK5jbJqDr/ncU7cKimLzKB3Wlk2Y0=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_pclint to perform static code analysis on C/C++ code using PC-lint.";
  };
})
