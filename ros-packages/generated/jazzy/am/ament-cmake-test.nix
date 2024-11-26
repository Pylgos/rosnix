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
  version = "2.5.2-1";
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
        rev = "4a2003a2e58c6c07a8c787f049431907f2c95d5d";
        hash = "sha256-RKywy1QY2j4gqIjiM79unPTrERgcjW3AdJihPKnwYpk=";
      };
    };
  });
  meta = {
    description = "The ability to add tests in the ament buildsystem in CMake.";
  };
})
