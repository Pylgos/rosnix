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
  version = "0.3.0-3";
  src = finalAttrs.passthru.sources."eigen3_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "eigen3_cmake_module" = substituteSource {
      src = fetchgit {
        name = "eigen3_cmake_module-source";
        url = "https://github.com/ros2-gbp/eigen3_cmake_module-release.git";
        rev = "558850a9bed7e064e1dd11c03f5c43eaeaa8f656";
        hash = "sha256-k2+KI5dgNItTq+Q9z/ORtjXBmyG29cWrs8Hwqk6lw5k=";
      };
    };
  });
  meta = {
    description = "Exports a custom CMake module to find Eigen3.";
  };
})
