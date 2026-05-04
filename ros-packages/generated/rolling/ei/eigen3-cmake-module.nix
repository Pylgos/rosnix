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
  version = "0.5.1-2";
  src = finalAttrs.passthru.sources."eigen3_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "eigen3_cmake_module" = substituteSource {
      src = fetchgit {
        name = "eigen3_cmake_module-source";
        url = "https://github.com/ros2-gbp/eigen3_cmake_module-release.git";
        rev = "7fa69b291b576c48ced52ff7b05ae431b6b49d20";
        hash = "sha256-ocdaZAZmSHox6z5FXK7EXP588nFplDvGPDZVgODTEZw=";
      };
    };
  });
  meta = {
    description = "Exports a custom CMake module to find Eigen3.";
  };
})
