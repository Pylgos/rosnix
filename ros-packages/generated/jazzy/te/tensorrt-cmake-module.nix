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
  version = "0.0.3-4";
  src = finalAttrs.passthru.sources."tensorrt_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tensorrt_cmake_module" = substituteSource {
        src = fetchgit {
          name = "tensorrt_cmake_module-source";
          url = "https://github.com/ros2-gbp/tensorrt_cmake_module-release.git";
          rev = "24346a131e0ffd199c767dd1582fdef9af42e19c";
          hash = "sha256-S620gK89qsxhq1mo2yFSZCD1LP45mJBLXJbCTiT5VZk=";
        };
      };
    });
  };
  meta = {
    description = "Exports a CMake module to find TensorRT.";
  };
})
