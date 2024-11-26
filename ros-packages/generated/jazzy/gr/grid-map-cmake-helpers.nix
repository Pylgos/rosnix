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
  pname = "grid_map_cmake_helpers";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map_cmake_helpers";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_cmake_helpers" = substituteSource {
      src = fetchgit {
        name = "grid_map_cmake_helpers-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "c3a95c8f659224e8936b341b52398b6841a69393";
        hash = "sha256-eDT1hj+wOKMqJbOziWgmv3XwJQxTX+DgL1iQc5yhVpM=";
      };
    };
  });
  meta = {
    description = "CMake support functionality used throughout grid_map";
  };
})
