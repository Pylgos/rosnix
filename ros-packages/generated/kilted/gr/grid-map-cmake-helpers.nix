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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."grid_map_cmake_helpers";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_cmake_helpers" = substituteSource {
      src = fetchgit {
        name = "grid_map_cmake_helpers-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "2e92e337caedf716bdc4aa6d53d0319332724506";
        hash = "sha256-FRpYIFia8V8GZzGgp6lDLD3nQVN4aFSDDB2mSe0UVjA=";
      };
    };
  });
  meta = {
    description = "CMake support functionality used throughout grid_map";
  };
})
