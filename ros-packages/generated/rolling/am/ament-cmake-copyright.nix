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
  version = "0.20.0-1";
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
        rev = "a3a7eb88211ec0b2e2af0e14ed9496874730ca71";
        hash = "sha256-9I6drLq+HwS8ezxnrElHHSbCktkkfGFQ7hYhhPd5Gms=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_copyright to check every source file contains copyright reference.";
  };
})
