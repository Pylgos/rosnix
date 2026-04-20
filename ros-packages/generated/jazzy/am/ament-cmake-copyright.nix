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
  version = "0.17.5-1";
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
        rev = "8b47db8bd75eff7943e3762c4dd62ee90c3c66c2";
        hash = "sha256-rv/zsl58XTiDT22CGQI3RW77ByAZKUADlYWDtiVav4A=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_copyright to check every source file contains copyright reference.";
  };
})
