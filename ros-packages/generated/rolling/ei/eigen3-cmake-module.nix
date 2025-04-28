{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "eigen3_cmake_module";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."eigen3_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "eigen3_cmake_module" = substituteSource {
      src = fetchgit {
        name = "eigen3_cmake_module-source";
        url = "https://github.com/ros2-gbp/eigen3_cmake_module-release.git";
        rev = "dfef82bb9caa4f4612fbdd54a35aa7d231d19596";
        hash = "sha256-diQOoh3HJ2nPNPh2TTh1ATVY+fmPa7YS1FDYYZnnPLI=";
      };
    };
  });
  meta = {
    description = "Exports a custom CMake module to find Eigen3.";
  };
})
