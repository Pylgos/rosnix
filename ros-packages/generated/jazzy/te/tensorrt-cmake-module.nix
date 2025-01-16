{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tensorrt_cmake_module";
  version = "0.0.4-1";
  src = finalAttrs.passthru.sources."tensorrt_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "tensorrt_cmake_module" = substituteSource {
      src = fetchgit {
        name = "tensorrt_cmake_module-source";
        url = "https://github.com/ros2-gbp/tensorrt_cmake_module-release.git";
        rev = "1d2f8da19f68e7c0daca2f394c00b83142a5a7a1";
        hash = "sha256-oUVi2L9gZtNOWCWYCE7RZBmeWqrCZ0TWl8J3/BPBd6I=";
      };
    };
  });
  meta = {
    description = "Exports a CMake module to find TensorRT.";
  };
})
