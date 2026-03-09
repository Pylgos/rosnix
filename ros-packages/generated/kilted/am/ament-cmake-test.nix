{
  ament-cmake-core,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_test";
  version = "2.7.5-1";
  src = finalAttrs.passthru.sources."ament_cmake_test";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_test" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_test-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "e9b50e52665591c2f9aa8a55fa5f3d2cad894ab9";
        hash = "sha256-8tLxM21WBTDVUA4jrdUkUFLZuBP51BEzU8sUuE3SHac=";
      };
    };
  });
  meta = {
    description = "The ability to add tests in the ament buildsystem in CMake.";
  };
})
