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
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."grid_map_cmake_helpers";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_cmake_helpers" = substituteSource {
      src = fetchgit {
        name = "grid_map_cmake_helpers-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "0f240b1733b0441414a578bb1c46208d9a8fe5f6";
        hash = "sha256-e9GleacU9v7LnpyuyAjN67UL1MZOrdRtuZs524RWXXc=";
      };
    };
  });
  meta = {
    description = "CMake support functionality used throughout grid_map";
  };
})
