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
  version = "2.8.6-1";
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
        rev = "e44a63d11efb54acc4fd4275f0f0537c12aaf0cf";
        hash = "sha256-4abSJ69E5v4d6F0f7X7iUkasZ1gft2jJ+EO7TlDr2wk=";
      };
    };
  });
  meta = {
    description = "The ability to add tests in the ament buildsystem in CMake.";
  };
})
