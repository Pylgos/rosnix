{
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-copyright,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_copyright";
  version = "0.19.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_copyright";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-copyright ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-copyright ];
  checkInputs = [ ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_copyright" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "2bd03544a0e351d2fc83f6e94780d41e1fcc0d60";
        hash = "sha256-dAnaCm87biFMxip9y1ZB4t6psDbto6AWygaQBb0RAGQ=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_copyright to check every source file contains copyright reference.";
  };
})
