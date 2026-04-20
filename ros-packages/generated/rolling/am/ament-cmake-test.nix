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
  version = "2.8.7-1";
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
        rev = "d23fc1432a4fd5102e8b58a438595094e7b2eac9";
        hash = "sha256-7Ox2M7HblhiIZuu1MVS9EMe/1coaFhcmROFtlKF3f5E=";
      };
    };
  });
  meta = {
    description = "The ability to add tests in the ament buildsystem in CMake.";
  };
})
