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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."eigen3_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "eigen3_cmake_module" = substituteSource {
      src = fetchgit {
        name = "eigen3_cmake_module-source";
        url = "https://github.com/ros2-gbp/eigen3_cmake_module-release.git";
        rev = "cc75f807bbc52d044c86fdfc4c7a8e075a1ddf53";
        hash = "sha256-KQUVSjAi9dDk9itOgrGGMWYE4MHIltisCQbFFcE2ZQE=";
      };
    };
  });
  meta = {
    description = "Exports a custom CMake module to find Eigen3.";
  };
})
