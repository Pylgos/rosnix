{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_libraries";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_libraries";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_libraries" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "b0e5b782a80c27a183e6e732bf99cb7a557404f6";
        hash = "sha256-HqzdOiUrBb9ATw3/D+8GcwFAUmqx3J1dsEQaxNmRP+Q=";
      };
    };
  });
  meta = {
    description = "The functionality to deduplicate libraries in the ament buildsystem in CMake.";
  };
})
