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
  version = "0.20.3-1";
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
        rev = "08336b002a62f5e6b699c967fc2c08b106da9927";
        hash = "sha256-tyNZWfkFI7H+T1p7LBBMyYG8kF71UWbeKPbz2WAPwtM=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_copyright to check every source file contains copyright reference.";
  };
})
