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
  version = "2.2.2-2";
  src = finalAttrs.passthru.sources."grid_map_cmake_helpers";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_cmake_helpers" = substituteSource {
      src = fetchgit {
        name = "grid_map_cmake_helpers-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "4b8ff9647e72899368ea353603c4919c527f4ee0";
        hash = "sha256-kcscXOWe/5qNiGed0oO3bK+hyzyiyeZF/RGDNxK3eIU=";
      };
    };
  });
  meta = {
    description = "CMake support functionality used throughout grid_map";
  };
})
