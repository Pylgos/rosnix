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
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."tensorrt_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "tensorrt_cmake_module" = substituteSource {
      src = fetchgit {
        name = "tensorrt_cmake_module-source";
        url = "https://github.com/ros2-gbp/tensorrt_cmake_module-release.git";
        rev = "e62a11b4777b9238d98cff5020c504507c10d8e7";
        hash = "sha256-Dxr8f79YywxaTAFZXakeucspxxAetcTnywqmSGTJN4c=";
      };
    };
  });
  meta = {
    description = "Exports a CMake module to find TensorRT.";
  };
})
