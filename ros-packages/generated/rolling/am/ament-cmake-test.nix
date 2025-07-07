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
  version = "2.8.4-1";
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
        rev = "deb9473d589feb775a93b9d13c502e9ef0013bde";
        hash = "sha256-mSGVWRzIWG5l34ZKo9FRshvrrJBDQKC4ZtXrjxSPvvk=";
      };
    };
  });
  meta = {
    description = "The ability to add tests in the ament buildsystem in CMake.";
  };
})
